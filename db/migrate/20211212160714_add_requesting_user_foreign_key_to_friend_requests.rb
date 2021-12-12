class AddRequestingUserForeignKeyToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :friend_requests, :users, column: :requesting_user_id
  end
end
