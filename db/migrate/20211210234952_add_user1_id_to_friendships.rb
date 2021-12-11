class AddUser1IdToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :user1_id, :bigint
  end
end
