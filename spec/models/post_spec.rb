require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid' do
    post = Post.new(Title: 'test', Text: 'testing post', user_id: 1)
    post.save
    expect(post).to be_valid
  end

  it 'is not valid' do
    post = Post.new(Text: 'testing post', user_id: 1)
    post.save
    expect(post).to_not be_valid
  end

  it 'update post counter' do
    post = Post.new(Text: 'testing post', user_id: 1)
    post.save
    post.update_post_counter
    expect(post.user.PostsCounter).to eql(1)
  end

  it 'recent comment' do
    post = Post.find(1).recent_comment
    expect(post.count).to eq(1)
  end

  it 'length validation' do
    title = 'E' * 251
    post = Post.new(Title: title, Text: 'testing post', user_id: 1)
    post.save
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be an integer' do
    post = Post.new(Title: 'test', Text: 'testing post', user_id: 1)
    post.CommentsCounter = 0.1
    post.save
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be greater than 0' do
    post = Post.new(Title: 'test', Text: 'testing post', user_id: 1)
    post.CommentsCounter = -1
    post.save
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be an Integer' do
    post = Post.new(Title: 'test', Text: 'testing post', user_id: 1)
    post.LikesCounter = 0.1
    post.save
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be greater than 0' do
    post = Post.new(Title: 'test', Text: 'testing post', user_id: 1)
    post.LikesCounter = -1
    post.save
    expect(post).to_not be_valid
  end
end
