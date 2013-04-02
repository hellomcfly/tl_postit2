class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?, :find_post, :all_cats

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

  def can_edit
    @post = Post.find(params[:id])
    if not logged_in?
      flash[:error] = "You're not allowed to do that."
      redirect_to "/posts/#{@post.id}"
    elsif current_user.id != @post.user.id
      flash[:error] = "You're not allowed to do that."
      redirect_to "/posts/#{@post.id}"
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def all_cats
    @categories = Category.all
  end

end
