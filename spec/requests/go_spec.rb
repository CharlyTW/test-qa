# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Go login", type: :request do
  before { Rails.application.load_seed }

  it "signs in famille and redirects to listings" do
    get "/go/famille"
    expect(response).to redirect_to(listings_path)
    follow_redirect!
    expect(response.body).to include("Famille")
  end
end
