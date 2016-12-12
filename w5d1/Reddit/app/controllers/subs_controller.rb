class SubsController < ApplicationController
  before_action :is_moderator?, only: [:edit, :update]

  def is_moderator?
    mod_id = Sub.find_by(id: params[:id]).user_id
    redirect_to subs_url unless mod_id == current_user.id
  end

  def index
    @subs = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
    render :new
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end


  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end


  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
