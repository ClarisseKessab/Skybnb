class AddTravellersToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :travellers, :integer
  end
end
