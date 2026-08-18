# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: "Account"

  validates :content, presence: true, length: { maximum: 2000 }
end
