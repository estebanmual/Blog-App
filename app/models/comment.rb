class Comment < ApplicationRecord
  validates :Text, presence: true

  belongs_to :user
  belongs_to :post

  def update_comment_count
    post.increment!(:CommentsCounter)
  end
end
