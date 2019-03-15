class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy take return]
  before_action :find_like, only: :show
  after_action :set_histories, only: %i[take return]

  def index
    @books = Book.all.page(params[:page]).per(5)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    redirect_to books_path if @book.save
  end

  def edit; end

  def update; end

  def show
    @comment = Comment.new
    @comments = @book.comments.order_by(created_at: :desc)
    @histories = @book.histories.order_by(take: :desc)
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def take
    @history = History.new(user_id: current_user.id, book_id: @book.id, take: Time.now)
    return unless @history.save
    @book.available = !@book.available
    @book.save
    @histories = @book.histories.order_by(take: :desc)
  end

  def return
    @history = History.where(user_id: current_user.id, book_id: params[:id]).last
    @history.return = Time.now
    return unless @history.save
    @book.available = !@book.available
    @book.save
    @histories = @book.histories.order_by(take: :desc)
  end

  def search
    @books = Book.all
    if params[:search]
      @search_books = Book.search(params[:search])
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author_id, :image, :description)
  end

  def set_histories
    @histories = @book.histories.order_by(take: :desc)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def find_like
    @like = Like.where(user_id: current_user.id, book_id: params[:id]).first
  end

end
