class Comment < ApplicationRecord
  validates :Text, presence: true

  belongs_to :user
  belongs_to :post, counter_cache: true

  def update_comment_count
    post.comments_count
  end
end
