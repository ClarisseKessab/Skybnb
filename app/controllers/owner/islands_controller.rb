class Owner::IslandsController < ApplicationController
  def index
    @islands = Island.where(user: current_user)
  end

  def edit
    @island = Island.find(params[:id])
  end

  def update
    @island = Island.find(params[:id])
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :location, :gps_longitude, :gps_latitude, :price_per_night, :capacity, photos:[])
  end

  def set_island
    @island = Island.find(params[:id])
  end
end
