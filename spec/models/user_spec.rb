require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) do
    User.create!(
      email: 'fake@email.com',
      password: 'password',
      name: 'fake_test'
    )
  end

  let!(:user2) do
    User.create!(
      email: 'test@email.com',
      password: 'test123',
      name: 'friend_test'
    )
  end
  let!(:friendship) do
    Friendship.create!(
      user: user1,
      friend: user2
    )
  end
  describe 'Actions for users' do
    it '#friends -> empty array' do
      expect(user1.friends).to be_empty
    end

    it '#friends -> not empty array' do
      user2.confirm_friend(user1)
      expect(user1.friends).to_not be_empty
    end

    it '#pending_friends -> not empty array' do
      expect(user1.pending_friends).to_not be_empty
    end

    it '#pending_friends -> be empty' do
      expect(user2.pending_friends).to be_empty
    end

    it '#friend_requests -> not empty' do
      expect(user2.friend_requests).to_not be_empty
    end
    it '#friend_requests -> empty' do
      user2.confirm_friend(user1)
      expect(user2.friend_requests).to be_empty
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
