class Api::UsersController < ApplicationController
helper_method :current_user

  def create
    @user = User.new(user_params)
    @user.profile_picture = "http://res.cloudinary.com/andoo/image/upload/c_crop,h_175,r_100,w_173,x_74,y_0/v1484764852/vonrulf1kpsuhqlxobir.png"
    @user.email = "sample@email.com"
    if @user.save
      sign_in(@user)
      render "api/users/show"
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find(params[:id])
    @user_pins = @user.pins
    @user_boards = @user.boards
    @followed_by = @user.followed_by
    @following = @user.following
    @curr_user = current_user
    curr_user_record = User.find(current_user.id)
    follow_ids = curr_user_record.following.map { |follow| follow.id}
    @isFollowing = follow_ids.include?(@user.id)
    render :show
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :profile_picture)
  end

  def update_params
    params.permit(:id, :email, :profile_picture)
  end
end
