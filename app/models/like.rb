class Like
  include Mongoid::Document
  # field :liking, type: Mongoid::Boolean
  field :count_of_stars, type: Integer
  belongs_to :user
  belongs_to :book, counter_cache: :counter

  after_create :rating
  # after_destroy :decrement_count_like

  private
  def rating
    if self.count_of_stars
      rating = 0
      self.book.likes.each do |like|
        rating += like.count_of_stars
      end
      rating /= self.book.likes.count
      self.book.rating = rating
      puts self.book.rating
    end
  end

  # def decrement_count_like
  #   if self.liking
  #     Book.decrement_counter(:like, self.book)
  #   else
  #     Book.decrement_counter(:dislike, self.book)
  #   end
  # end
end
