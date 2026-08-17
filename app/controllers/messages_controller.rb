# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_account!

  def create
    conversation = Conversation.find(params[:conversation_id])
    unless conversation.participant?(current_account)
      redirect_to conversations_path, alert: "Conversation introuvable."
      return
    end

    if request.format.html? && !request.format.turbo_stream?
      message = conversation.messages.create!(
        sender: current_account,
        content: params.dig(:chat_message, :content)
      )
      conversation.conversation_accounts.each do |membership|
        membership.increment_unread! unless membership.account_id == current_account.id
      end
      Turbo::StreamsChannel.broadcast_append_to(
        conversation,
        target: "messages",
        partial: "messages/message",
        locals: { message: message }
      )
      redirect_to conversation_path(conversation) and return
    end

    message = Message.new(conversation: conversation, sender: current_account)
    form = ::Chat::MessageForm.new(message)

    if form.validate(message_params) && form.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "message_form",
            partial: "messages/form",
            locals: {
              conversation: conversation,
              form: ::Chat::MessageForm.new(Message.new(conversation: conversation, sender: current_account))
            }
          )
        end
        format.html { redirect_to conversation_path(conversation) }
      end
    else
      messages = conversation.messages.includes(:sender).order(:created_at)
      membership = conversation.membership_for(current_account)
      render "conversations/show",
        status: :unprocessable_entity,
        locals: {
          conversation: conversation,
          membership: membership,
          messages: messages,
          form: form,
          other: conversation.other_account(current_account)
        }
    end
  end

  private

  def message_params
    params.require(:chat_message).permit(:content)
  end
end
