require 'rails_helper'

RSpec.feature 'Friendship creation', type: :feature do
  describe 'friendship progress' do
    before :each do
      User.create!(name: 'Test1', email: 'this@test.com', password: '123456')
      User.create!(name: 'Test2', email: 'other@test.com', password: '123456')
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'this@test.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'commit'
      click_link('All users')

      click_link('Send friendship invitation')
      click_link('Sign out')
      within('#new_user') do
        fill_in 'user_email', with: 'other@test.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'commit'
      click_link('All users')
    end

    it 'displays the request' do
      expect(page).to have_content 'Accept invitation'
    end

    it 'displays friendship' do
      click_link('Accept')
      expect(page).to have_content 'Is your friend'
    end
  end
end
