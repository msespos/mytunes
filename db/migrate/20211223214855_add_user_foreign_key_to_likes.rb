class AddUserForeignKeyToLikes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :likes, :users, column: :user_id
  end
end
