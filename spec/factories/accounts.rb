# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    sequence(:slug) { |n| "account-#{n}" }
    sequence(:display_name) { |n| "Account #{n}" }
  end
end
