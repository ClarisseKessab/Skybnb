class RenameUserInIsland < ActiveRecord::Migration[7.1]
  def change
    rename_column :islands, :users_id, :user_id
   # add_index :islands, :user_id
    #rename_index :islands, 'index_islands_on_users_id', 'index_islands_on_user_id'
  end
end
