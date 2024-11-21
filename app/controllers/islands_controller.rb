class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end

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

  def search
    @search = Search.new(search_params)

    @islands = Island.all

    # Filtrer par location
    if @search.location.present?
      @islands = @islands.where("location ILIKE ?", "%#{@search.location}%")
    end

    # Filtrer par date d'arrivée et de départ
    if @search.arrival_date.present? && @search.departure_date.present?
      @islands = @islands.where("availability_start <= ? AND availability_end >= ?", @search.arrival_date, @search.departure_date)
    end

    # Gestion du nombre de voyageurs
    @travellers = @search.travellers.to_i
    # S'assurer que @travellers est au moins égal à 1
    @travellers = [@travellers, 1].max

    # Filtrer par nombre de voyageurs si présent
    if @travellers > 0
      @islands = @islands.where("capacity >= ?", @travellers)
    end

    render :index
  end

  private

  def search_params
    params.fetch(:search, {}).permit(:location, :arrival_date, :departure_date, :travellers)
  end

  def island_params
    params.require(:island).permit(:name, :description, :location, :gps_longitude, :gps_latitude, :price_per_night, :capacity, photos:[])
  end
end
