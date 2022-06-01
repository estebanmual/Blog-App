require 'rails_helper'

RSpec.describe 'Posts requests tests', type: :request do
  describe 'Get #index' do
    before(:example) { get user_posts_path(user_id: 1) }
    it 'render list of users' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'Get #show' do
    before(:example) { get user_post_path(id: 1, user_id: 1) }
    it 'render user profile' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index view' do
      expect(response).to render_template(:show)
    end
  end
end

RSpec.describe 'Posts views tests', type: :system do
  describe 'Index view' do
    it 'shows the right content' do
      visit user_posts_path(user_id: 1)
      expect(page).to have_content('This is the page for all of the posts of the user with id: 1')
    end
  end

  describe 'Show view' do
    it 'shows the right content' do
      visit user_post_path(id: 1, user_id: 1)
      expect(page).to have_content('This is the page of the post with id: 1 of the user with id 1')
    end
  end
end
