class PostsController < ApplicationController

  before_filter :require_user, except: [:index, :show]

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @comment = @post.comments.build
    @users = User.all
  end

  def new
  	@post = Post.new
  	@users = User.all    
  end

  def create
  	@post = Post.new(params[:post])
    @post.user = current_user
  	@users = User.all    

  	if @post.save
  		flash[:notice] = "Your post was created."
  		redirect_to posts_path
  	else
  		@post.errors
  		render 'new'
  	end
  end

end
