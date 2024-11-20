class BookingsController < ApplicationController
  before_action :set_guest, only: %i[new create]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
    @guest = current_user
    @island = Island.find(params[:island_id])
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = @guest
    @island = Island.find(params[:island_id])
    @booking.island = @island
    @booking.status = "pending"
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params_booking)

    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path, status: :see_other
  end

  private

  def set_guest
    @guest = current_user
  end

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :status, :island_id, :user_id)
  end
end
