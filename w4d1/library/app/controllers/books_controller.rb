class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    new_book = Book.new
  end

  def create
    new_book = Book.new(book_params)
    new_book.save
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
