# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    conversation
    association :sender, factory: :account
    content { "Bonjour" }
  end
end
