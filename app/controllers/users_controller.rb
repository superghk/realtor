class UsersController < ApplicationController
  before_action :user_is_logged_in, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def show
  	  @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash.now[:success] = "Welcome to the Elena's Realtors App!"
  		redirect_to @user
  	else
  		flash.now[:danger] = "Sorry your information was not valid"
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Your changes have been successfully saved!"
      redirect_to @user
    else
    	flash.now[:danger] = "Sorry your changes have not been saved."
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end

    

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
