# frozen_string_literal: true

FactoryBot.define do
  factory :listing do
    account
    title { "Annonce exemple" }
    body { "Description de l'annonce." }
  end
end
