class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @user_show = User.find(params[:id])
    @new_book = Book.new
    @books = Book.all
  end

  def edit
    @user_show = User.find(params[:id])
  end

  def create
    @new_user = User.new(user_params)
    @users = User.all
    @new_user.save
    redirect_to user_path(@user)
  end

  def update
    @user_show = User.find(params[:id])
    if @user_show.update(user_params)
      flash[:user_update] = "You have updated user successfully."
      redirect_to user_path(@user_show)
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def baria_user
    unless User.find(params[:id]).user.id.to_i == current_user.id
      redirect_to root_path
    end
  end

end

