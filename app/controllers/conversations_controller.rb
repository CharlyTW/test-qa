# frozen_string_literal: true

class ConversationsController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_account!

  def index
    memberships = current_account.conversation_accounts
      .visible
      .includes(conversation: [ { messages: :sender }, :accounts ])
      .to_a
      .sort_by { |membership| membership.conversation.messages.maximum(:created_at) || Time.at(0) }

    render :index, locals: { memberships: memberships }
  end

  def show
    conversation = Conversation.find(params[:id])
    membership = conversation.conversation_accounts.find_by(account: current_account)
    membership&.reset_unread!
    broadcast_badge!(current_account) if membership

    messages = conversation.messages.includes(:sender).order(:created_at)
    form = ::Chat::MessageForm.new(Message.new(conversation: conversation, sender: current_account))
    other = conversation.accounts.find { |account| account.id != current_account.id }
    render :show, locals: {
      conversation: conversation,
      membership: membership,
      messages: messages,
      form: form,
      other: other
    }
  end

  def create
    listing = Listing.find(params[:listing_id] || params[:id])
    conversation = Conversation.find_or_create_between!(current_account, listing.account)
    redirect_to conversation_path(conversation)
  end

  def archive
    conversation = Conversation.find(params[:id])
    unless conversation.participant?(current_account)
      redirect_to conversations_path, alert: "Conversation introuvable."
      return
    end

    membership = conversation.membership_for(current_account)
    membership.archive!

    peer = conversation.other_account(current_account)
    if peer
      peer_membership = conversation.membership_for(peer)
      Turbo::StreamsChannel.broadcast_remove_to(peer, target: dom_id(peer_membership))
    end

    redirect_to conversations_path, notice: "Conversation archivée."
  end

  private

  def broadcast_badge!(account)
    Turbo::StreamsChannel.broadcast_replace_to(
      account,
      target: "unread_badge",
      partial: "conversations/unread_badge",
      locals: { account: account }
    )
  end
end
