# frozen_string_literal: true

# migration
class AddUserIdToLike < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :user_id, :bigint
  end
end
