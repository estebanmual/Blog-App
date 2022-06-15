require 'rails_helper'

RSpec.describe 'login page', type: :feature do
    it 'input' do
      visit '/users/sign_in'
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
    end

    it 'log in with empty inputs' do
      visit '/users/sign_in'
      click_button 'Log in'
      expect(page).to have_content('Invalid email or password')
    end

    describe 'the signin process', type: :feature do
      before :each do
        User.create(email: 'user1@gmail.com', password: 'password', name: 'User1')
      end
      it 'signs @user in' do
        visit '/users/sign_in'
        fill_in 'email', with: 'hola@hola.com'
        fill_in 'password', with: 'password'
        click_button 'Log in'
       expect(current_path).to eq(root_path)
       expect(page).to have_text('Signed in successfully.')
      end
     end    
end