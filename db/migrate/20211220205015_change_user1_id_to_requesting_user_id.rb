class ChangeUser1IdToRequestingUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :friendships, :user1_id, :requesting_user_id
  end
end
