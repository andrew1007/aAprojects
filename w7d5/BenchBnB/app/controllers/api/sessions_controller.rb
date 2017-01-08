class Api::SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # debugger
    if @user
      sign_in(@user)
    else
      render(json:["invalid username/password combo"], status: 401)
    end
  end

  def destroy
    user = User.find_by(session_token: session[:session_token])
    sign_out
  end
end
