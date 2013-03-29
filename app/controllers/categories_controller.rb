class CategoriesController < ApplicationController

  before_filter :require_user

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(params[:category])

  	if @category.save
  		flash[:notice] = "Your category was created."
  		redirect_to root_path
  	else
  		@category.errors
  		render 'new'
  	end
  end

end
