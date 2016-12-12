class TracksController < ApplicationController

  def show
    @track = Track.find_by(id: params[:id])
  end

  def edit
    @track = find_track(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new()
  end
  def destroy
    curr_track = Track.find_by(id: params[:id])
    curr_track.destroy
    redirect_to album_url(curr_track.album_id)
  end

  private

  def find_track(params_id)
    Track.find_by(id: params_id)
  end

  def track_params
    params.require(:track).permit(:name, :album_id)
  end
end
