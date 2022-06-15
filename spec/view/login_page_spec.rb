require 'rails_helper'

RSpec.describe 'login page', type: :feature do
    # before :each do
    #     user = User.new(Name: 'Esteban', email: 'hola@hola.com', password: 'password' )
    # end
    it 'input' do
      visit '/users/sign_in'
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
    end

    it 'log in with empty inputs' do
      visit '/users/sign_in'
      click_button 'Log in'
      expect(page).to have_content('Please enter a valid email')
    end
    
end