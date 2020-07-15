class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  def friends
    friends_array = friendships.map do |friendship|
      friendship.friend if friendship.confirmed
    end
    inverse = inverse_friendships.map do |friendship|
      friendship.user if friendship.confirmed
    end
    friends_array += inverse
    friends_array.compact
  end

  def pending_friends
    friendships.map do |friendship|
      pending_friend = friendship.friend
      confirm_friendship = pending_friend.friendships.map do |fnd|
        true if fnd.friend.id == current_user.id
      end
      pending_friend if confirm_friendship.empty?
    end.compact
  end

  def friend_requests
    inverse_friendships.map do |pfnd|
      friend_request = pfnd.friend
      confirm_friendship = friend_request.friendships.map do |fnd|
        true if fnd.friend.id == current_user.id
      end
      friend_request if confirm_friendship.empty?
    end.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find do |fndship|
      fndship.user == user
    end
    friendship.confirmed = true
    friendship.save
  end

  def reject_friend(user)
    friendship = inverse_friendships.find do |fndship|
      fndship.user == user
    end
    friendship.destroy
  end

  def friend?(user)
    friends.include?(user)
  end

  def pending_friends?(user)
    pending_friends.include?(user)
  end

  def friend_requests?(user)
    friend_requests.include?(user)
  end
end
