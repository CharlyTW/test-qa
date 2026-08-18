# frozen_string_literal: true

class Conversation < ApplicationRecord
  has_many :conversation_accounts, dependent: :destroy
  has_many :accounts, through: :conversation_accounts
  has_many :messages, dependent: :destroy

  def self.find_or_create_between!(account_a, account_b)
    if account_a.id == account_b.id
      existing = account_a.conversations.includes(:conversation_accounts).find do |conversation|
        conversation.conversation_accounts.size == 1
      end
      return existing if existing

      conversation = create!
      conversation.conversation_accounts.create!(account: account_a)
      return conversation
    end

    ids = [ account_a.id, account_b.id ].sort
    account_a.conversations.includes(:accounts).find_each do |conversation|
      participant_ids = conversation.accounts.map(&:id).sort
      return conversation if participant_ids == ids
    end

    conversation = create!
    conversation.conversation_accounts.create!(account: account_a)
    conversation.conversation_accounts.create!(account: account_b)
    conversation
  end

  def other_account(account)
    accounts.find { |participant| participant.id != account.id }
  end

  def membership_for(account)
    conversation_accounts.find_by!(account_id: account.id)
  end

  def participant?(account)
    conversation_accounts.exists?(account_id: account.id)
  end
end
