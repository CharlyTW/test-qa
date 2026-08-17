# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_account

  private

  def current_account
    return @current_account if defined?(@current_account)

    @current_account = Account.find_by(id: session[:account_id])
  end

  def authenticate_account!
    return if current_account

    redirect_to root_path, alert: "Connecte-toi via /go/famille ou /go/intervenant."
  end
end
