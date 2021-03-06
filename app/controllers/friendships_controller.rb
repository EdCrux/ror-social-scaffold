class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friendships = current_user.friends
    @pending_friends = current_user.pending_friends
    @friend_requests = current_user.friend_requests
  end

  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])

    if @friendship.save
      redirect_to users_path, notice: 'Friendship request sent'
    else
      redirect_to users_path, alert: 'You cannot request this friendship'
    end
  end

  def update
    @user = User.find(params[:id])
    @friendship = current_user.inverted_friendships.confirm_friendship(@user)
    redirect_to users_path, notice: 'Friend added'
  end

  def destroy
    @user = User.find(params[:id])
    @friendship = current_user.inverted_friendships.reject_friendship(@user)
    redirect_to users_path, notice: 'Invitation rejected'
  end
end
