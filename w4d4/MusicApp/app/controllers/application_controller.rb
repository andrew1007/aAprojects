class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  helper_method :current_user, :log_out, :logged_in?

  def log_in(user)
    # debugger
    user.reset_session_token!
    session[:session_token] = user.session_token
    current_user
    # redirect_to user_url(user)
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
    # debugger
  end

  def logged_in?
    @current_user.nil?
  end

  def log_out
    @current_user = nil
    session[:session_token] = nil
    # redirect_to new_session_url
  end
end
