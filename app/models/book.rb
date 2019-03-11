class Book
  include Mongoid::Document
  has_many :histories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  field :name, type: String
  field :author, type: String
  field :available, type: Boolean, default: true
  field :description, type: String
  field :publishing_house, type: String
  field :year, type: Date
  field :rating, type: Float, default: 0
  field :counter, type: Integer
  mount_uploader :image, FileUploader

  validates_presence_of :name

  def is_taken_by(user_id)
    histories.where(user_id: user_id, return: nil).exists?
  end

  def is_liked_by(user_id)
    likes.where(user_id: user_id).exists?
  end
end