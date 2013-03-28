class CommentsController < ApplicationController

    def create
    @post = Post.find(params[:post_id])
    @users = User.all
  	@comment = Comment.new(params[:comment])
    @comment.post_id = @post.id

  	if @comment.save
  		flash[:notice] = "Your comment was created."
  		redirect_to posts_path(@post)
  	else
  		@comment.errors
  		render 'posts/show'
  	end
  end

end
