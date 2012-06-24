class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user, only: :destroy


  def index
    @users = User.paginate(page: params[:page])
  end

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
      sign_in @user
  		flash[:success] = "Welcome to DrJid's first Rails App!"
  		redirect_to @user #We can omit user_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      #handle successful update
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else  
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    name = @user.name
    User.find(params[:id]).destroy
    flash[:success] = "#{name} destroyed."
    redirect_to users_path
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in"
      end
    end
    

    def correct_user
      @user = User.find(params[:id])
      #Keeps the correct user in the game, redirect if not the correct user. 
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
