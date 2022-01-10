class AddPostTypeToLike < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :post_type, :string
  end
end
