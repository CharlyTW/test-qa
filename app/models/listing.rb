# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :account

  validates :title, :body, presence: true
end
