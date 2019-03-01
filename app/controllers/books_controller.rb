class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy, :take_return, :new_like, :delete_like ]
  before_action :find_like, only: [ :new_like, :show ]
  # before_action :average_rating, only: [:show]

  def index
    @books = Book.all.page(params[:page]).per(5)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.status = true #status in
    @book.rating = 0
    redirect_to books_path if @book.save
  end

  def edit
  end

  def update
  end

  def show
    @comment = Comment.new
    @comments = @book.comments
    @histories = @book.histories.order_by(take: :desc)
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def take_return
    if @book.status
      @history = History.new(user_id: current_user.id, book_id: @book.id, take: Time.now)
    else
      @history = History.where(user_id: current_user.id, book_id: params[:id]).last
      @history.return = Time.now
    end
    if @history.save
      @book.status = !@book.status
      @book.save
    end
    @histories = @book.histories.order_by(take: :desc)
  end

  def new_like
    @old_like.destroy if !@old_like.nil?
    @like = Like.new(user_id: current_user.id, book_id: params[:id], count_of_stars: like_params[:like])
    @like.save
  end

  private
  def average_rating
    likes = @book.likes
    @rating = 0
    likes.each do |like|
      @rating += like.count_of_stars
    end
    @rating /= likes.count
  end

  def book_params
    params.require(:book).permit(:name, :author, :image, :description)
  end

  def like_params
    params.require(:like).permit(:like)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def find_like
    @old_like = Like.where(user_id: current_user.id, book_id: params[:id]).first
  end
end
