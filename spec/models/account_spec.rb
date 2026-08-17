# frozen_string_literal: true

require "rails_helper"

RSpec.describe Account, type: :model do
  it "is valid with slug, names and role" do
    expect(build(:account)).to be_valid
  end

  it "syncs display_name from first and last name" do
    account = create(:account, first_name: "Sophie", last_name: "Martin", role: "famille")
    expect(account.display_name).to eq("Sophie Martin")
    expect(account.role_label).to eq("Famille")
  end
end
