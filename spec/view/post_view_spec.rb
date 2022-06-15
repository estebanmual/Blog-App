require 'rails_helper'

RSpec.describe 'Posts index', type: :feature do
  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'hola@hola.com'
    fill_in 'Password', with: 'mex420'
    click_button 'Log in'
    visit '/users/1/posts'
  end

  it "I can see the user's profile picture." do
    expect(page).to have_selector('img')
  end

  it "I can see the user's username." do
    expect(page).to have_content('Esteban')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('Number of posts: 2')
  end

  it "I can see a post's title." do
    expect(page).to have_content('Post #1')
  end

  it "I can see some of the post's body." do
    expect(page).to have_content('This is my first post')
  end

  it 'I can see the first comments on a post.' do
    expect(page).to have_content('This is my first comment')
  end

  it 'I can see how many comments a post has.' do
    expect(page).to have_content('Comments: 1')
  end

  it 'I can see how many likes a post has.' do
    expect(page).to have_content('Likes: 0')
  end

  it "When I click on a post, it redirects me to that post's show page." do
    click_on 'Post #1'
    expect(current_path).to eq('/users/1/posts/1')
  end
end

RSpec.describe 'Post show', type: :feature do
  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'hola@hola.com'
    fill_in 'Password', with: 'mex420'
    click_button 'Log in'
    visit '/users/1/posts/1'
  end

  it "I can see the post's title." do
    expect(page).to have_content('Post #1')
  end

  it 'I can see who wrote the post.' do
    expect(page).to have_content('Esteban')
  end

  it 'I can see how many comments it has.' do
    expect(page).to have_content('Comments: 0')
  end

  it 'I can see how many likes it has.' do
    expect(page).to have_content('Likes: 0')
  end

  it 'I can see the post body.' do
    expect(page).to have_content('This is my first post')
  end

  it 'I can see the username of each commentor.' do
    expect(page).to have_content('Joaquin')
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content('This is my first comment')
  end
end
