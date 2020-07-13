class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friendships = current_user.friends
    @pending_friends = current_user.pending_friends
    @friend_requests = current_user.friend_requests
  end

  def confirm_friendship(user)
    current_user.confirm_friend(user)
  end

  def update
    @friendship = Friendship.find_by(user: current_user, friend_id: params[:friend_id])
    if @friendship
      redirect_to users_path, notice: 'Friendship accepted'
      current_user.confirm_friend(@friendship.friend)
    else
      redirect_to users_path, alert: 'Something went wrong' 
    end
  end

  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])

    if @friendship.save
      redirect_to users_path, notice: 'Friendship request sent'
    else
      redirect_to users_path, alert: 'You cannot request this friendship' 
    end
  end


end