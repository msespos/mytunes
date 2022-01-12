# frozen_string_literal: true

# migration
class RenamePostsToTextPosts < ActiveRecord::Migration[6.1]
  def change
    rename_table :posts, :text_posts
  end
end
