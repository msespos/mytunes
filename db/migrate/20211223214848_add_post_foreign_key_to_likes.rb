# frozen_string_literal: true

# migration
class AddPostForeignKeyToLikes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :likes, :posts, column: :post_id
  end
end
