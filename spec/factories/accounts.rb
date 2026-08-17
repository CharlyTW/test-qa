# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    sequence(:slug) { |n| "account-#{n}" }
    sequence(:first_name) { |n| "Prénom#{n}" }
    sequence(:last_name) { |n| "Nom#{n}" }
    role { "famille" }
  end
end
