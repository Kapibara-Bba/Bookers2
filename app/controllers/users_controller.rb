class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end

