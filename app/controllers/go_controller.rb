# frozen_string_literal: true

# Seed login — GET /go/:slug sets the session account (NT-style).
class GoController < ApplicationController
  def show
    account = Account.find_by!(slug: params[:slug])
    session[:account_id] = account.id
    redirect_to listings_path, notice: "Connecté en tant que #{account.display_name}."
  end
end
