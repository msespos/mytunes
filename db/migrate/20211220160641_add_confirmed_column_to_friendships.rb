class AddConfirmedColumnToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_column :friendships, :confirmed, :boolean
  end
end
