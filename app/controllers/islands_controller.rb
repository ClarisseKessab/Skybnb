class IslandsController < ApplicationController
  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
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
    @island = Island.find(params[:id])
  end

  private

  def island_params
    params.require(:island).permit(:name, :description, :location, :gps_longitude, :gps_latitude, :price_per_night, :capacity, photos:[])
  end
end
