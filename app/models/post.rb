class Post < ApplicationRecord
  validates :Title, presence: true, length: { maximum: 250 }
  validates :Text, presence: true
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  vaalidates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def update_post_counter
    user.increment!(:PostsCounter)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
