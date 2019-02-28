class Like
  include Mongoid::Document
  # field :liking, type: Mongoid::Boolean
  field :count_of_stars
  belongs_to :user
  belongs_to :book, counter_cache: :counter

  # after_create :increment_count_like
  # after_destroy :decrement_count_like

  private
  # def increment_count_like
  #   if self.liking
  #     Book.increment_counter(:like, self.book)
  #   else
  #     Book.increment_counter(:dislike, self.book)
  #   end
  # end
  #
  # def decrement_count_like
  #   if self.liking
  #     Book.decrement_counter(:like, self.book)
  #   else
  #     Book.decrement_counter(:dislike, self.book)
  #   end
  # end
end
