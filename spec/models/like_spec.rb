require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it 'validate content' do
      should validate_uniqueness_of(:user_id)
        .scoped_to(:post_id)
    end
  end

  describe 'associations' do
    it do
      should belong_to(:user)
      should belong_to(:post)
    end
  end
end
