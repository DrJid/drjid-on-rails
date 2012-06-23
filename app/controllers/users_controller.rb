class UsersController < ApplicationController



  def show
  	#use Params to retrieve the user id. 
  	@user = User.find(params[:id])
  end

  def new
  	#Will have to put @user in here at some point. 
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		#Handle successful save
  		flash[:success] = "Welcome to DrJid's first Rails App!"
  		redirect_to @user #We can omit user_path
  	else
  		render 'new'
  	end
  end
  
end
