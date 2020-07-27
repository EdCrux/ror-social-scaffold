require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'validate content' do
      should validate_presence_of(:content)
      should validate_length_of(:content)
        .is_at_most(1000)
        .with_message('1000 characters in post is the maximum allowed.')
    end
  end

  describe 'associations' do
    it do
      should belong_to(:user)
      should have_many(:comments).dependent(:destroy)
      should have_many(:likes).dependent(:destroy)
    end
  end
end
