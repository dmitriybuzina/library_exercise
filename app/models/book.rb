class Book
  include Mongoid::Document
  has_many :histories
  has_many :comments
  field :name, type: String
  field :author, type: String
  field :status, type: Boolean
  field :description, type: String
  mount_uploader :image, FileUploader
end