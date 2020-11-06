class AddFriendToFriendship < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :friend, references: :users, index: true
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
