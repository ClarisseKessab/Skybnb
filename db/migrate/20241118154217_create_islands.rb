class CreateIslands < ActiveRecord::Migration[7.1]
  def change
    create_table :islands do |t|
      t.string :name
      t.text :description
      t.string :location
      t.float :price_per_night
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
