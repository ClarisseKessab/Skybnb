class IslandsController < ApplicationController
  def new
    @island = Island.new
  end

  def create
    @island = Island.new(list_params)
    if @island.save
      redirect_to island_path(@island)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :location, :gps_longitude, :gps_latitude, :price_per_night; :capacity)
      end
end
