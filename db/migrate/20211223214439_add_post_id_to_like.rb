# frozen_string_literal: true

# migration
class AddPostIdToLike < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :post_id, :bigint
  end
end
