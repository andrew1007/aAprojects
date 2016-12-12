require 'byebug'
class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      render json: @new_user
    else
      render(
        json: @new_user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @user_show = User.find(params[:id])
    render json: @user_show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render( jason: @user.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def destroy
    user = User.find(params[:id])
    render json: user.destroy

  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
