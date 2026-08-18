# frozen_string_literal: true

module Chat
  # Validates and persists a chat message, then broadcasts Turbo updates.
  class MessageForm < Reform::Form
    property :content

    validates :content, presence: true, length: { maximum: 2000 }

    def save
      return false unless valid?

      message = model
      message.content = content
      message.save!

      apply_side_effects!(message)
      true
    end

    private

    def apply_side_effects!(message)
      conversation = message.conversation
      sender = message.sender

      conversation.conversation_accounts.each do |membership|
        next if membership.account_id == sender.id

        membership.increment_unread!
      end

      broadcast_thread!(conversation, message)
    end

    def broadcast_thread!(conversation, message)
      Turbo::StreamsChannel.broadcast_append_to(
        conversation,
        target: "messages",
        partial: "messages/message",
        locals: { message: message }
      )
    end
  end
end
