class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  belongs_to :user
  belongs_to :book, counter_cache: :counter

  validates_presence_of :body
end
