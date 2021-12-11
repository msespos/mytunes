class AddUser2IdToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :user2_id, :bigint
  end
end
