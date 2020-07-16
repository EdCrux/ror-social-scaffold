require 'rails_helper'
RSpec.describe Friendship, type: :model do
  describe 'friendship associations' do
    it do
      should belong_to(:user)
      should belong_to(:friend).class_name('User')
    end
  end

  let!(:sender) do
    User.create!(
      email: 'fake@email.com',
      password: 'password',
      name: 'fake_test'
    )
  end

  let!(:receiver) do
    User.create!(
      email: 'test@email.com',
      password: 'test123',
      name: 'friend_test'
    )
  end

  let!(:friendship) do
    Friendship.create!(
      user: sender,
      friend: receiver
    )
  end

  describe 'friendship methods' do
    it 'confirm_friendship(sender) - > true' do
      expect(receiver.inverted_friendships.confirm_friendship(sender)).to be(true)
    end

    it 'confirm_friendship(receiver) - > false' do
      expect(sender.inverted_friendships.confirm_friendship(receiver)).to be(false)
    end

    it 'reject_friendship(receiver) - > false' do
      puts
      expect(sender.inverted_friendships.reject_friendship(receiver)).to be(false)
    end

    it 'reject_friendship(sender) - > true' do
      expect(receiver.inverted_friendships.reject_friendship(sender)).to be_kind_of(Friendship)
    end
  end
end
