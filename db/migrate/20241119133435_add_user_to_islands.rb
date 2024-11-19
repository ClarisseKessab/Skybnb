class AddUserToIslands < ActiveRecord::Migration[7.1]
  def change
    add_reference :islands, :users, null: false, foreign_key: true
  end
end
