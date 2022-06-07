class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  def update_like_counter
    post.likes_count
  end
end
