class FriendshipsController < ApplicationController
  def index
    @users = User.where('id<>?', current_user.id)
    @friendships = Friendship.all
  end
  
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.create(friendship_params)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
