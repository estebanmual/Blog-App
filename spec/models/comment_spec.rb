require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid' do
    comment = Comment.new(Text: 'testing commnent', post_id: 5, user_id: 12)
    comment.save
    expect(comment).to be_valid
  end

  it 'is not valid' do
    comment = Comment.new(Text: 'testing commnent', user_id: 12)
    comment.save
    expect(comment).to_not be_valid
  end

  it 'update comment count' do
    comment = Comment.new(Text: 'testing commnent', post_id: 5, user_id: 13)
    comment.save
    comment.update_comment_count
    expect(comment.post.CommentsCounter).to eql(2)
  end
end
