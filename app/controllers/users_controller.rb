class UsersController < ApplicationController
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
    @user = User.new(user_params)
    @users = User.all
    @user.save
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:user_update] = "You have updated user successfully."
      redirect_to user_path(@user.id)
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

end