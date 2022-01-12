# frozen_string_literal: true

# migration
class AddPostTypeToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :post_type, :string
  end
end
