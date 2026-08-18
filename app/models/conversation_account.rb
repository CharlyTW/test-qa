# frozen_string_literal: true

class ConversationAccount < ApplicationRecord
  belongs_to :conversation
  belongs_to :account

  scope :visible, -> { where(archived_at: nil) }

  def archive!
    update!(archived_at: Time.current)
  end

  def unarchive!
    update!(archived_at: nil)
  end

  def archived?
    archived_at.present?
  end

  def increment_unread!
    increment!(:unread)
  end

  def reset_unread!
    update!(unread: 0)
  end
end
