class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    #@user_show = User.find(params[:id])
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    #@user_show = User(params[:id])
    @new_book = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    end
  end

  def create
    @user = current_user
    @new_book = Book.new(book_params)
    @books = Book.all
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:create] = "You have creatad book successfully."
      redirect_to book_path(@new_book)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


  def baria_user
    unless Book.find(params[:id]).book.id.to_i == current_user.id
      redirect_to root_path
    end
  end

end
