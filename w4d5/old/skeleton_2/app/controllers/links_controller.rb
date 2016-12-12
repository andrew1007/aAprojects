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
      flash[:errors] = ["Asdfasf"]
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    @link = Link.find_by(params[:id])
    if @link.user_id == current_user.id
      @link.update_attributes(link_params)
    else
      flash[:errors] = ["Asdfasdf"]
      redirect_to links_url
    end
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
