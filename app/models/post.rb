class Post < ApplicationRecord
  validates :Title, presence: true
  validates :Text, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
