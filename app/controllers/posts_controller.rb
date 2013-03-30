class PostsController < ApplicationController

  before_filter :require_user, except: [:index, :show]
  before_filter :can_edit, only: [:edit]

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @comment = @post.comments.build
    @comment.user = current_user
  end

  def new
  	@post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    @categories = Category.all

  	if @post.save
  		flash[:notice] = "Your post was created."
  		redirect_to "/posts/#{@post.id}"
  	else
  		@post.errors
  		render 'new'
  	end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end


  def update
    @post = Post.find(params[:id])
    @categories = Category.all

    if @post.update_attributes(params[:post])
      flash[:notice] = "Your post was edited."
      redirect_to "/posts/#{@post.id}"
    else
      @post.errors
      render 'edit'
    end
  end

end
