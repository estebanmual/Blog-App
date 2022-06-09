require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is not valid' do
    like = Like.new(user_id: 12)
    like.save
    expect(like).to_not be_valid
  end

  it 'is valid' do
    like = Like.new(user_id: 12, post_id: 5)
    like.save
    expect(like).to be_valid
  end

  it 'update like counter' do
    like = Like.new(user_id: 12, post_id: 5)
    like.save
    like.update_like_counter
    expect(like.post.LikesCounter).to eql(1)
  end
end
