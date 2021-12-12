class DropFriendRequestsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :friend_requests
  end
end
