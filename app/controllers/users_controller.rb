class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      # auto_login(@user)
  		redirect_to projects_url, :notice => "Signed Up"
      #redirect_back_or_to root_url
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :name, :profile)
  end
end
