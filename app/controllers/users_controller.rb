class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @profile_images = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
