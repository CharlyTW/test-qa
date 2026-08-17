# frozen_string_literal: true

class ListingsController < ApplicationController
  before_action :authenticate_account!

  def index
    listings = Listing.includes(:account).order(:title)
    render :index, locals: { listings: listings }
  end

  def show
    listing = Listing.find(params[:id])
    render :show, locals: { listing: listing }
  end
end
