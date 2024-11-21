class AddPaidPriceToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :paid_price, :float
  end
end
