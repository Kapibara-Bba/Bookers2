class SearchesController < ApplicationController

  def search

    @range = params[:range]
    @word = params[:word]
    @search = params[:search]
    if @range == 'user'
      @user = User.search_for(@word,@search)
    else
      @book = Book.search_for(@word,@search)
    end
  end
end
