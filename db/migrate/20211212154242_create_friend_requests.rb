# frozen_string_literal: true

# migration
class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.bigint :requesting_user_id
      t.bigint :requested_user_id

      t.timestamps
    end
  end
end
