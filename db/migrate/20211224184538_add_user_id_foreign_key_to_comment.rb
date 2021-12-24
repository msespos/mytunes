# frozen_string_literal: true

# migration
class AddUserIdForeignKeyToComment < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :users, column: :user_id
  end
end
