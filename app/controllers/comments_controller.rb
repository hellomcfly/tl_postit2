class CommentsController < ApplicationController
    before_filter :require_user

    def create
    @post = Post.find(params[:post_id])
    @users = User.all
  	@comment = Comment.new(params[:comment])
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

  	if @comment.save
  		flash[:notice] = "Your comment was created."
  		redirect_to posts_path(@post)
  	else
  		@comment.errors
  		render 'posts/show'
  	end
  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, user: current_user, vote: params[:vote]) 

    respond_to do |format|
      format.html do
        flash[:success] = "Vote tallied!"
        redirect_to :back
      end
      format.js
    end    

  end


end
