class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])
    if @user
      log_in(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["User does not exist"]
      render :new
    end
  end

  def destroy
    # fail
    log_out
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
