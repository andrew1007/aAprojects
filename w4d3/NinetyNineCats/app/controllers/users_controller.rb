class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in(@user) #make this method
        redirect_to cats_url
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:user_name, :password)
      #:session token is not a user input
    end
end
