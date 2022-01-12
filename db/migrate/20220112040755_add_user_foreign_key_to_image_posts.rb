# frozen_string_literal: true

# migration
class AddUserForeignKeyToImagePosts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :image_posts, :users, column: :user_id
  end
end
