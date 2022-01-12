# frozen_string_literal: true

# migration
class CreateImagePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :image_posts do |t|
      t.bigint :user_id

      t.timestamps
    end
  end
end
