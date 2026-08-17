# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path, notice: "Déconnecté."
  end
end
