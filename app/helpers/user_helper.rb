module UserHelper
  def button(friend)
      if !Friendship.exists?(user_id: current_user.id, friend_id: friend.id)
        render 'request_btn', friend: friend
      end
  end
end  