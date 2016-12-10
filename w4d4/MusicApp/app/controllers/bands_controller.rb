class BandsController < ApplicationController
  def index
    @band = Band.all
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def destroy
    Band.find_by(id: params[:id]).destroy
    redirect_to bands_url
  end
end
