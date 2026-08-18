# frozen_string_literal: true

FactoryBot.define do
  factory :conversation do
    transient do
      accounts { [] }
    end

    after(:create) do |conversation, evaluator|
      evaluator.accounts.each do |account|
        conversation.conversation_accounts.find_or_create_by!(account: account)
      end
    end
  end
end
