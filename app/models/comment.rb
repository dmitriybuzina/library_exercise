class Comment
  include Mongoid::Document
  field :body, type: String
  belongs_to :user
  belongs_to :book, counter_cache: :counter
end
