class History
  include Mongoid::Document
  field :take, type: Time
  field :return, type: Time
  # embeds_many :book
  # embeds_many :user
  embedded_in :user
  embedded_in :book
end