# frozen_string_literal: true

# migration
class AddRequestedUserForeignKeyToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :friend_requests, :users, column: :requested_user_id
  end
end
