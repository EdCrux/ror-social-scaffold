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
  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: "Friendship"
  has_many :friends, through: :confirmed_friendships

  def pending_friends
    friendships.map do |friendship|
      pending_friend = friendship.friend
      confirm_friendship = pending_friend.friendships.map do |fnd|
        true if fnd.friend.id == id
      end
      pending_friend if confirm_friendship.empty?
    end.compact
  end

  def friend_requests
    inverse_friendships.map do |pfnd|
      friend_request = pfnd.user
      confirm_inverse_friendship = friend_request.inverse_friendships.map do |fnd|
        true if fnd.friend.id == id
      end
      friend_request if confirm_inverse_friendship.empty?
    end.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find do |fndship|
      fndship.user == user
    end
    friendships.build(friend: friendship.user).save
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
