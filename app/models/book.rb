class Book
  include Mongoid::Document
  field :name, type: String
  field :author, type: String
  field :status, type: Mongoid::Boolean
end
