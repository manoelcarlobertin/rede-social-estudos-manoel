class Post < ApplicationRecord
  belongs_to :user

  validates :photo, attached: true
  validates :photo, content_type: [ :png, :jpg, :jpeg ]

  has_one_attached :photo
  has_many :comments
  has_many :likes
end
