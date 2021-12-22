# frozen_string_literal: true

# migration
class ChangeUser2IdToRequestedUserId < ActiveRecord::Migration[6.1]
  def change
    rename_column :friendships, :user2_id, :requested_user_id
  end
end
