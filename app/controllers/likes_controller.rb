class LikesController < ApplicationController
  before_action :set_book, only: [:create, :show]
  before_action :find_like

  def index
  end

  def new
    @like = Like.new
  end

  def create
    @like.destroy if @like
    @like = @book.likes.create(like_params)
    @like.user_id = current_user.id
    @like.save
  end

  def update
  end

  def show
  end

  def destroy
    @like.destroy
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def like_params
    params.require(:like).permit(:user_id, :book_id, :count_of_stars)
  end

  def find_like
    @like = Like.where(user_id: current_user.id, book_id: params[:book_id]).first
  end
end
