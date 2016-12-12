class LinksController < ApplicationController
  before_action :require_logged_in

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = ["Asdfsda"]
      render :new
    end
  end

  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if current_user.id == @link.user_id
      @link.update_attributes(link_params)
    else
      flash[:errors] = ["Asdfsda"]
      redirect_to links_url
    end
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
