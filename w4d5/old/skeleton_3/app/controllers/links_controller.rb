class LinksController < ApplicationController
  before_action :require_signed_in

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = ["Asdfafd"]
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
    if @link.user_id == current_user.id
      @link.update_attributes(link_params)
    else
      flash[:error] = ["Asdf"]
      redirect_to new_session_url
    end
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
