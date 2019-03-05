class WelcomeController < ApplicationController
  before_action :top_books

  def index
    @books = Book.all
  end

  protected
  def top_books
    @top_books = Book.order('counter Desc').limit(5)
  end
end