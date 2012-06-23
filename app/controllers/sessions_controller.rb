class SessionsController < ApplicationController

	def new
	end

	def create
		#there is a params[:session] inside the create action
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination' #Not quite right! 
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end

end
