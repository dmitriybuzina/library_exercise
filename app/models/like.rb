class Like
  include Mongoid::Document
  field :count_of_stars, type: Integer
  belongs_to :user
  belongs_to :book, counter_cache: :counter

  after_create :rating

  private

  def rating
    return unless self.count_of_stars

    book.rating = 0
    book.likes.each do |like|
      book.rating += like.count_of_stars
    end
    book.rating /= book.likes.count
    book.save
  end
end