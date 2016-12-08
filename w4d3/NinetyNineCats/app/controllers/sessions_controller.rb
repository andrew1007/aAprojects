class SessionsController < ApplicationController


  def new
    render :new
  end

  def create
    # debugger
    @user = User.find_by_credentials(session_params[:user_name], session_params[:password])

    if @user
      # debugger
      log_in(@user)
      flash[:messages] = ['welcome back']
      # debugger
      redirect_to cats_url
    else
      flash.now[:messages] = ['invalid log credentials']
      render :new
    end
    #find user in databse
    #compare password make sure it's right
    #login
  end

  def destroy
    log_out
    @user.session_token = nil
  end

  private
  def session_params
    params.require(:user).permit(:user_name, :password)
    #:session token is not a user input
  end
end
