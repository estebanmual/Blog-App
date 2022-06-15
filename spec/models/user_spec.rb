require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    user = User.new(Name: 'Esteban', email: 'test2@test2.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid' do
    user = User.new(Bio: 'testing user')
    user.save
    expect(user).to_not be_valid
  end

  it 'recent posts' do
    user = User.find(1).recent_posts
    expect(user.last.id).to eql(1)
  end
end
