# frozen_string_literal: true

class Account < ApplicationRecord
  ROLES = %w[famille intervenant].freeze

  has_one :listing, dependent: :destroy
  has_many :conversation_accounts, dependent: :destroy
  has_many :conversations, through: :conversation_accounts

  validates :slug, :first_name, :last_name, :role, presence: true
  validates :slug, uniqueness: true
  validates :role, inclusion: { in: ROLES }

  before_validation :sync_display_name

  def full_name
    [ first_name, last_name ].compact_blank.join(" ")
  end

  def role_label
    case role
    when "famille" then "Famille"
    when "intervenant" then "Intervenant·e"
    else role.to_s.humanize
    end
  end

  def famille?
    role == "famille"
  end

  def intervenant?
    role == "intervenant"
  end

  def unread_total
    conversation_accounts.sum(:unread)
  end

  private

  def sync_display_name
    self.display_name = full_name
  end
end
