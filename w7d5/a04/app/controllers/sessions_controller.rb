class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # debugger
    if user
      sign_in(user)
      redirect_to links_url
    else
      flash[:errors] = "asdfsd"
      render :new
    end
  end

  def destroy
    user = User.find_by(session_token: session[:session_token])
    sign_out
  end
end
