class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def current_user
  	return false if session[:user_id].nil?
  	@current_user ||= User.find(session[:user_id])
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	unless logged_in?
  		flash[:error] = "Must login before doing that."
  		redirect_to login_path
  	end
  end

end
