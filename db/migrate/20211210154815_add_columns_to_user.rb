class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :project_name, :string
    add_column :users, :location, :string
    add_column :users, :favorite_artist, :string
    add_column :users, :birthday, :date
  end
end
