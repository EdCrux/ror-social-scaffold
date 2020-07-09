require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1){
    User.create!(
      email: 'fake@email.com',
      password: 'password',
      name: 'fake_test'
    )
  }

  let!(:user2){
    User.create!(
      email: 'test@email.com',
      password: 'test123',
      name: 'friend_test'
    )
  }
  let!(:friendship){
    Friendship.create!(
      user: user1,
      friend: user2,
    )
  }
  describe 'Actions for users' do
    it '#friends -> empty array' do
      expect(user2.friends).to be_empty
    end

    it '#friends -> not empty array' do
      user2.confirm_friend(user1)
      expect(user1.friends).to_not be_empty
    end


    it '#confirm_friend' do
      expect(user2.confirm_friend(user1)).to be(true)
    end

    it '#friend? -> false' do
      expect(user2.friend?(user1)).to be(false)
    end


    it '#friend? -> true' do
      user2.confirm_friend(user1)
      expect(user1.friend?(user2)).to be(true)
    end
  end
end
