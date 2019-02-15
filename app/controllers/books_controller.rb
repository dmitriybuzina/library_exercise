class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy, :take, :return, :new_like, :delete_like ]
  before_action :find_like, only: [ :new_like, :delete_like, :show ]

  def index
    @books = Book.all.page(params[:page]).per(5)
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
    @histories = @book.histories.order_by(return: :desc)
  end

  def destroy
    redirect_to books_path if @book.destroy
  end

  def take
    @history = History.new(user_id: current_user.id, book_id: @book.id, take: Time.now)
    if @history.save
      @book.status = false
      @book.save
      redirect_to @book
    end
  end

  def return
    history = History.where(user_id: params[:user_id], book_id: params[:id]).last
    history.return = Time.now
    if history.save
      @book.status = true
      @book.save
      redirect_to @book
    end
  end

  def new_like
    if !@old_like.nil?
      @old_like.destroy
    end
    respond_to do |format|
      format.js
    end
    @like = Like.new(user_id: current_user.id, book_id: params[:id], liking: params[:liking])
    redirect_to @book if @like.save
  end

  def delete_like
    redirect_to book_path(id: @book.id) if @old_like.destroy
  end

  private
  def book_params
    params.require(:book).permit(:name, :author, :image, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def find_like
    @old_like = Like.where(user_id: current_user.id, book_id: params[:id]).first
  end

end
