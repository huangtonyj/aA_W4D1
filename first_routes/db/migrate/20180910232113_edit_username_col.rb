class EditUsernameCol < ActiveRecord::Migration[5.2]
  def change
    # change_column_null(:users, :username, false)
    # change_column :users, :username, null: false
    # add_index :users, :username, unique: true
    # 
    
    remove_column :users, :username
    add_column :users, :username, :string, null: false
    
    add_index :users, :username, unique: true
  end
end
