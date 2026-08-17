# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :listing, dependent: :destroy

  validates :slug, :display_name, presence: true
  validates :slug, uniqueness: true
end
