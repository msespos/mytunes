# frozen_string_literal: true

# Create Friendship model
class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships, &:timestamps
  end
end
