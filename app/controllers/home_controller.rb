# frozen_string_literal: true

# Public landing — login is via /go/:slug seed links.
class HomeController < ApplicationController
  def index
    redirect_to listings_path and return if current_account

    render :index
  end
end
