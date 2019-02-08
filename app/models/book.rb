class Book
  include Mongoid::Document
  embeds_many :history

  field :name, type: String
  field :author, type: String
  field :status, type: Boolean
  field :description, type: String

  mount_uploader :image, FileUploader
end