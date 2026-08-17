# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Home", type: :request do
  it "shows demo login links when logged out" do
    get root_path
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("/go/famille")
    expect(response.body).to include("/go/intervenant")
  end

  it "redirects to listings when already logged in" do
    Rails.application.load_seed
    get "/go/famille"
    get root_path
    expect(response).to redirect_to(listings_path)
  end
end
