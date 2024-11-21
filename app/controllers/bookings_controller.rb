class BookingsController < ApplicationController
  # Removed unnecessary before_action :set_guest

  def index
    @guest_bookings = current_user.bookings
    @owner_bookings = Booking.joins(:island).where(islands: { user_id: current_user.id })
  end

  # Since the form is on the islands/show page, the new action is no longer needed
  # def new
  #   @booking = Booking.new
  #   @island = Island.find(params[:island_id])
  # end

  def create
    @island = Island.find(params[:island_id])
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @booking.island = @island
    @booking.status = "pending"

    if @booking.save
      redirect_to dashboard_path, notice: 'Booking successfully created.'
    else
      # Ensure all variables needed for islands/show are set
      render 'islands/show', status: :unprocessable_entity
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

    redirect_to dashboard_path, status: :see_other
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :status, :island_id, :user_id, :paid_price, :travellers)
  end
end
