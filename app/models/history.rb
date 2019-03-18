class History
  include Mongoid::Document
  field :take, type: Time
  field :return, type: Time
  belongs_to :user
  belongs_to :book, counter_cache: :counter

  validates_presence_of :take
end
