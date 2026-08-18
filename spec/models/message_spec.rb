# frozen_string_literal: true

require "rails_helper"

RSpec.describe Message, type: :model do
  it "requires content" do
    expect(build(:message, content: "")).not_to be_valid
  end
end
