# frozen_string_literal: true

require "rails_helper"

RSpec.describe ConversationAccount, type: :model do
  it "archives and unarchives" do
    membership = create(:conversation_account)
    membership.archive!
    expect(membership).to be_archived
    membership.unarchive!
    expect(membership).not_to be_archived
  end
end
