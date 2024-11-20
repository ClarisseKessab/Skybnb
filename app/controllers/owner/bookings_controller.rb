class Owner::BookingsController < ApplicationController
  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to bookings_path
    end
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.status = "refused"
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to bookings_path
    end
  end
end
