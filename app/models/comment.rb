class Comment < ApplicationRecord
  validates :Text, presence: true

  belongs_to :user
  belongs_to :post
end
