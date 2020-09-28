class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @user_s = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.save
    redirect_to book_path(@books)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@books)
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
