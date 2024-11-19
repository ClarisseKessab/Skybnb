class AddGpsCoordinatesToIslands < ActiveRecord::Migration[7.1]
  def change
    add_column :islands, :gps_longitude, :string
    add_column :islands, :gps_latitude, :string
  end
end
