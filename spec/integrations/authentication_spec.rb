require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  describe 'the signin process' do
    before :each do
      User.create!(name: 'Test', email: 'this@test.com', password: '123456')
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'this@test.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'commit'
    end

    it 'signs me in' do
      expect(page).to have_content 'Sign out'
    end

    it 'signs me out' do
      click_link('Sign out')
      expect(page).to have_content 'Sign in'
    end
  end
end
