class Owner::BookingsController < ApplicationController
  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.status = "cancelled"
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end
end
