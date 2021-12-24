# frozen_string_literal: true

# migration
class AddPostIdForeignKeyToComment < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :posts, column: :post_id
  end
end
