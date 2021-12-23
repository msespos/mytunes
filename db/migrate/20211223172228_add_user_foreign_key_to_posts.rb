# frozen_string_literal: true

# migration
class AddUserForeignKeyToPosts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :users, column: :user_id
  end
end
