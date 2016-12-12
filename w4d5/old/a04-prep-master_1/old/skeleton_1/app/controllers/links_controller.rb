class LinksController < ApplicationController
  before_action :is_signed_in?

  def is_signed_in?
    redirect_to new_session_url unless signed_in?
  end

  def index
  end

  def new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    if !signed_in?
      redirect_to new_session_url
      return
    end
    @link = Link.find_by(params[:id])
    @link.update(link_params)

  end
  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
