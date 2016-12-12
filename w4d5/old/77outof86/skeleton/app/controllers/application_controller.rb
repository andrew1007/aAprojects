class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def log_in(user)
    @current_user = user
    session[:session_token] = @current_user.session_token
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_out
    current_user.reset_token!
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end
end
