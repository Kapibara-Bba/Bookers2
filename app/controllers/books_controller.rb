class BooksController < ApplicationController

  def index
    @user = current_user
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @new_book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @new_book.save
      flash[:create] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = "You have updated book successfully."
      redirect_to book_path(@book.id)
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

end
