class DropUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :islands, :user, foreign_key:true
    remove_reference :bookings, :user, foreign_key:true
    drop_table :users
  end
end
