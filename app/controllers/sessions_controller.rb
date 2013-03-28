class SessionsController < ApplicationController

	def create
		user = User.where(name: params[:name]).first

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "You're logged in!"
			redirect_to root_path
		else
			flash[:error] = "Incorrect credentials. Please try again."
			redirect_to login_path
		end

	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You're logged out."
		redirect_to root_path
	end

end