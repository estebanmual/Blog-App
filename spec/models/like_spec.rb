require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is not valid' do
    like = Like.new(user_id: 6)
    like.save
    expect(like).to_not be_valid
  end
  
  it 'is valid' do
    like = Like.new(user_id: 6, post_id: 6)
    like.save
    expect(like).to be_valid
  end
end
