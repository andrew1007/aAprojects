class AlbumsController < ApplicationController
  def index
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    # debugger
    @new_album = Album.new(album_params)
    @new_album.save!
    redirect_to album_url(@new_album)
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  def update
    # debugger
    @album = Album.find_by(id: album_params[:band_id])
    @album.update_attributes(album_params)
    redirect_to album_url(@album)
  end

  def destroy
    fail
    # debugger
    Album.find_by(id: params[:id]).destroy
    redirect_to albums_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :year, :style, :band_id)
  end
end
