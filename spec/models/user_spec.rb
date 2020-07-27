require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should validate name' do
      should validate_presence_of(:name)
      should validate_length_of(:name)
        .is_at_most(20).on(:create)
    end
  end

  describe 'associations' do
    it 'should have many posts' do
      should have_many(:posts)
    end

    it 'should have many comments' do
      should have_many(:comments).dependent(:destroy)
    end

    it 'should have many likes' do
      should have_many(:likes).dependent(:destroy)
    end

    it 'should have many friendships' do
      should have_many(:friendships).dependent(:destroy)
    end

    it 'should have many confirmed_friendships' do
      should have_many(:confirmed_friendships)
        .class_name('Friendship')
        .conditions(confirmed: true)
    end

    it 'should have many friends through confirmed_friendships' do
      should have_many(:friends).through(:confirmed_friendships)
    end

    it 'should have many pending_friendships' do
      should have_many(:pending_friendships)
        .conditions(confirmed: false)
        .class_name('Friendship')
        .with_foreign_key(:user_id)
    end

    it 'should have many pending_friends, through pending_friendships' do
      should have_many(:pending_friends)
        .through(:pending_friendships)
        .source(:friend)
    end

    it 'should have many inverted_friendships' do
      should have_many(:inverted_friendships)
        .conditions(confirmed: false)
        .class_name('Friendship')
        .with_foreign_key(:friend_id)
    end

    it 'should have many friend_requests' do
      should have_many(:friend_requests)
        .through(:inverted_friendships)
        .source(:user)
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

  describe 'Actions for users' do
    it '#friend? -> false' do
      expect(receiver.friend?(sender)).to be(false)
    end

    it '#pending_friend? -> true' do
      expect(sender.pending_friends?(receiver)).to be(true)
    end

    it '#pending_friend? -> false' do
      expect(receiver.pending_friends?(sender)).to be(false)
    end

    it '#friend_requests? -> true' do
      expect(receiver.friend_requests?(sender)).to be(true)
    end

    it '#friend_requests? -> false' do
      expect(sender.friend_requests?(receiver)).to be(false)
    end
  end
end
