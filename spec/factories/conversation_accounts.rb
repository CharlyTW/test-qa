# frozen_string_literal: true

FactoryBot.define do
  factory :conversation_account do
    conversation
    account
    unread { 0 }
  end
end
