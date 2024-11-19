class IslandsController < ApplicationController
  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    if @island.save
      redirect_to island_path(@island)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @islands = Island.all

    @islands = @islands.where("capacity >= ?", params[:capacity]) if params[:capacity].present?
    @islands = @islands.where(location: params[:location]) if params[:location].present?
    @islands = @islands.where("price <= ?", params[:price]) if params[:price].present?

    render :index
  end

  def show
    @bookings = Booking.new
    @reviews = Review.new
  end

  private

  def island_params
    params.require(:list).permit(:name, :description, :location, :gps_longitude, :gps_latitude, :price_per_night, :capacity)
  end
end
