# frozen_string_literal: true

require "rails_helper"

RSpec.describe Account, type: :model do
  it "is valid with slug and display_name" do
    expect(build(:account)).to be_valid
  end
end
