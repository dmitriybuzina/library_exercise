class Author
  include Mongoid::Document
  has_many :books
  field :first_name, type: String
  field :last_name, type: String
  field :date_of_birthday, type: String
end
