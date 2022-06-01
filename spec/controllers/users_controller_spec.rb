require 'rails_helper'

RSpec.describe 'Users requests tests', type: :request do
  describe 'Get #index' do
    before(:example) { get users_path }
    it 'render list of users' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'Get #show' do
    before(:example) { get user_path(id: 1) }
    it 'render user profile' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index view' do
      expect(response).to render_template(:show)
    end
  end
end

RSpec.describe 'Users views tests', type: :system do
  describe 'Index view' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Homepage where all users will be displayed')
    end
  end

  describe 'Show view' do
    it 'shows the correct content' do
      visit user_path(id: 1)
      expect(page).to have_content('This is the page for the user with the id 1')
    end
  end
end
