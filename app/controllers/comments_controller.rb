class CommentsController < ApplicationController

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
    @vote = Vote.create(voteable: @comment, user: current_user, vote: params[:vote]) 

      if @vote.vote == false
        flash[:alert] = "Downvote tallied!"
        redirect_to :back
      else
        flash[:success] = "Upvote tallied!"
        redirect_to :back
      end

  end


end
