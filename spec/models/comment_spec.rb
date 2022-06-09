require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid' do
    comment = Comment.new(Text: 'testing commnent', post_id: 6, user_id: 6)
    comment.save
    expect(comment).to be_valid
  end

  it 'is not valid' do
    comment = Comment.new(Text: 'testing commnent', user_id: 6)
    comment.save
    expect(comment).to_not be_valid
  end
end
