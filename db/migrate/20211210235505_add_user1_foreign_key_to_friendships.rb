# frozen_string_literal: true

# migration
class AddUser1ForeignKeyToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :friendships, :users, column: :user1_id
  end
end
