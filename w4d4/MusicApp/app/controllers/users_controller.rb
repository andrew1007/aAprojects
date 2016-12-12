class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def shows
    render :show
  end

  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:messages] = @user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
