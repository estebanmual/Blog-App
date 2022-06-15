require 'rails_helper'

RSpec.describe 'Users views tests', type: :system do
    describe 'Index view' do
      it 'shows the username of all users' do
        visit users_path
        expect(page).to have_selector('h2')
      end

      it 'shows the image of all users' do
        visit users_path
        page.should have_selector(:img, 'https://www.modaes.es/files/2020/11_revista/r40/728x350_4.png')
      end

      it 'shows the right content' do
        visit users_path
        expect(page).to have_content('Number of posts:')
      end

      it 'redirects to the users show page on click' do
        find_link(User.first.name).click
        expect(page).to have_current_path("/users/#{User.first.id}")
      end
    end

    describe 'Show view' do
      it 'shows the correct content' do
        visit user_path(id: 1)
        expect(page).to have_content('Bio')
      end
    end
  end
  