# frozen_string_literal: true

require "rails_helper"

RSpec.describe Conversation, type: :model do
  it "creates a conversation between two accounts" do
    a = create(:account)
    b = create(:account)
    conversation = described_class.find_or_create_between!(a, b)
    expect(conversation.accounts).to contain_exactly(a, b)
  end
end
