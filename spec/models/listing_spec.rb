# frozen_string_literal: true

require "rails_helper"

RSpec.describe Listing, type: :model do
  it "belongs to an account" do
    expect(build(:listing)).to be_valid
  end
end
