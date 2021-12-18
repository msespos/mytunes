# frozen_string_literal: true

# migration
class AddUser2ForeignKeyToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :friendships, :users, column: :user2_id
  end
end
