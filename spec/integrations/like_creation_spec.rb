require 'rails_helper'

RSpec.feature 'Like creation', type: :feature do
  describe 'Likes and dislikes process' do
    before :each do
      User.create(name: 'Kitpao', email: 'kit@pao.com', password: 'password')
      visit 'users/sign_in'
      within('#new_user') do
        fill_in 'user_email', with: 'kit@pao.com'
        fill_in 'user_password', with: 'password'
      end

      click_button 'commit'
      fill_in 'post_content', with: 'This is the content of the post'
      click_button 'commit', value: 'Save'
    end

    it 'likes a post' do
      click_link('Like!')
      expect(page).to have_content 'Dislike!'
    end

    it 'dislikes a post' do
      click_link('Like!')
      click_link('Dislike!')
      expect(page).to have_content 'Like!'
    end
  end
end
