require 'rails_helper'

RSpec.feature 'Post creation', type: :feature do
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

  it 'should have a content' do
    expect(page).to have_content('This is the content of the post')
  end
end
