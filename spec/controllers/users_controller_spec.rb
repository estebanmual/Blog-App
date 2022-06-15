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
