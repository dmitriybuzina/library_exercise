class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    @book = Book.new(book_params)
  end

  def edit
  end

  def update
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:name, :email, :status)
  end
end
