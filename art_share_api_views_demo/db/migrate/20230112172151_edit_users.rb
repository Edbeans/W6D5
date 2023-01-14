class EditUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :username
    change_column :users, :username, :string, unique: true
    remove_column :users, :email 
  end
end
