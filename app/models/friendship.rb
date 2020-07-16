class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.confirm_friendship(user)
    friendship_found = find_by(user_id: user.id)
    friendship_found.confirmed = true
    friendship_found.save
    current_user = friendship_found.friend
    new_friendship = current_user.friendships.build(friend: user, confirmed: true)
    new_friendship.save
  end
end
