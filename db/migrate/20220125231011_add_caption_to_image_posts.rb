# frozen_string_literal: true

# migration
class AddCaptionToImagePosts < ActiveRecord::Migration[6.1]
  def change
    add_column :image_posts, :caption, :string
  end
end
