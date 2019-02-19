class CommentsController < ApplicationController
  before_action :set_book, only: [ :index, :create ]

  def index
    @comments = @book.comments.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @book.comments.create(comment_params)
    @comment.user_id = current_user.id
    render 'books/show' unless @comment.save
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :book_id)
  end

end
