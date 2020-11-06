class FriendshipsController < ApplicationController
  def index
    @users = User.where('id<>?', current_user.id)
    @friendship = Friendship.new
    @friends = current_user.friends
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.create(friendship_params)
    redirect_to friendships_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id,:status)
  end
end
