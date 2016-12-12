class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      session[:session_token] = @user.session_token
      redirect_to links_url
    else
      flash[:errors] = ["ASdfas"]
      render :new
    end
  end

  def destroy
    log_out
    session[:session_token] = nil
  end
end
