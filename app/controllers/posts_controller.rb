class PostsController < ApplicationController

  before_filter :require_user, except: [:index, :show]
  before_filter :can_edit, only: [:edit]
  before_filter :find_post, only: [:show, :edit, :update, :vote]
  before_filter :all_cats, only: [:new, :create, :edit, :update]

  def index
  	@posts = Post.all
  end

  def show
    @comment = @post.comments.build
    @comment.user = current_user
    @comments = @post.comments.reload.all
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user

  	if @post.save
  		flash[:notice] = "Your post was created."
  		redirect_to "/posts/#{@post.id}"
  	else
  		@post.errors
  		render 'new'
  	end
  end

  def edit
    
  end


  def update

    if @post.update_attributes(params[:post])
      flash[:notice] = "Your post was edited."
      redirect_to "/posts/#{@post.id}"
    else
      @post.errors
      render 'edit'
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, user: current_user, vote: params[:vote]) 

    respond_to do |format|
      format.html do
        flash[:success] = "Vote tallied!"
        redirect_to :back
      end
      format.js
    end    

  end


end
