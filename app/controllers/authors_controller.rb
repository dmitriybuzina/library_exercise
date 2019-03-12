class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birthday)
  end
end
