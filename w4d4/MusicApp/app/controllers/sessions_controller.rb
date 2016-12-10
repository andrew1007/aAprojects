class SessionsController < ApplicationController
  def new
  end

  def create
    # debugger
    @user = User.find_by_credentials(*user_login_info.values)
    # debugger
    log_in(@user)
    redirect_to user_url(@user)
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private

  def user_login_info
    params.require(:user).permit(:email, :password)
  end
end
