# frozen_string_literal: true

# migration
class AddUserForeignKeyToAudioPosts < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :audio_posts, :users, column: :user_id
  end
end
