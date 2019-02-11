class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy, :new_history ]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.status = true #status in
    redirect_to books_path if @book.save
  end

  def edit
  end

  def update
  end

  def show
    @comments = @book.comments
    @histories = @book.histories
  end

  def destroy
  end

  def new_history
    @history = History.new(user: current_user, book: @book, take: Time.now)
    if @history.save!
      @book.status = false
      redirect_to @book
    end
  end

  def delete_history
  end

  private
  def book_params
    params.require(:book).permit(:name, :author, :image, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
