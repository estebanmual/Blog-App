require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    user = User.new(Name: 'Esteban', Bio: 'testing user')
    user.save
    expect(user).to be_valid
  end

  it 'is valid' do
    user = User.new(Bio: 'testing user')
    user.save
    expect(user).to_not be_valid
  end
end
