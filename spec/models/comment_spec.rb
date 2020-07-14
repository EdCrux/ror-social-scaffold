require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'validate content' do
      should validate_presence_of(:content)
      should validate_length_of(:content)
        .is_at_most(200)
        .with_message('200 characters in comment is the maximum allowed.')
    end
  end

  describe 'associations' do
    it do
      should belong_to(:user)
      should belong_to(:post)
    end
  end
end
