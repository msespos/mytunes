class AddDescriptionToAudioPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :audio_posts, :description, :string
  end
end
