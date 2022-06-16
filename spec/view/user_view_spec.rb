require 'rails_helper'

RSpec.describe 'Users views tests', type: :system do
  describe 'Index view' do
    it 'shows the username of all users' do
      visit users_path
      expect(page).to have_selector('h2')
    end

    it 'shows the profile picture of all users' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'shows the number of posts' do
      visit users_path
      expect(page).to have_content('Number of posts:')
    end

    it 'redirects to the users show page on click' do
      visit users_path
      link = page.find(:css, 'a[href="/users/1"]')
      link.click
      expect(page).to have_current_path('/users/1')
    end
  end

  describe 'Show view' do
    it 'shows the user profile picture' do
      visit user_path(id: 1)
      expect(page).to have_selector('img')
    end

    it 'shows the username' do
      visit user_path(id: 1)
      expect(page).to have_selector('h2')
    end

    it 'shows the number of posts' do
      visit users_path
      expect(page).to have_content('Number of posts:')
    end

    it 'shows the user bio' do
      visit user_path(id: 1)
      expect(page).to have_content('Bio')
    end

    it 'shows the last three posts' do
      visit user_path(id: 1)
      expect(page).to have_content('Post #')
    end

    it 'shows the See all posts button' do
      visit user_path(id: 1)
      expect(page).to have_content('See all posts')
    end

    it 'redirects to post show on click' do
      visit user_path(id: 1)
      link = page.find(:css, 'a[href="/users/1/posts/1"]')
      link.click
      expect(page).to have_current_path('/users/1/posts/1')
    end

    it 'redirects to post index on click' do
      visit user_path(id: 1)
      link = page.find(:css, 'a[href="/users/1/posts"]')
      link.click
      expect(page).to have_current_path('/users/1/posts')
    end
  end
end
