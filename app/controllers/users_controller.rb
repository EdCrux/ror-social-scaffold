class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    current_user.confirm_friend(@user)
    redirect_to users_path, notice: 'Friend added'
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
