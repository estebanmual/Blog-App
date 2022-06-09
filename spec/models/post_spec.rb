require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid' do
    post = Post.new(Title: 'test',Text: 'testing post', user_id: 6)
    post.save
    expect(post).to be_valid
  end

  it 'is not valid' do
    post = Post.new(Text: 'testing post', user_id: 6)
    post.save
    expect(post).to_not be_valid
  end  
end
