class Post < ApplicationRecord
  validates :Title, presence: true
  validates :Text, presence: true

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
