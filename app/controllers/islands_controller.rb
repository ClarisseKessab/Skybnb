class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
    @booking = Booking.new
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    @result = Geocoder.coordinates(params[:island][:location]);
    if @result
      @island.gps_longitude = @result[0].to_s
      @island.gps_latitude = @result[1].to_s
    else
      errors.add(:location, "Unable to find this location.")
    end
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

    # Filtrer par dates d'arrivée et de départ, en excluant les îles déjà réservées
    if @search.arrival_date.present? && @search.departure_date.present?
      # Convertir les dates si elles sont des chaînes de caractères
      @search.arrival_date = Date.parse(@search.arrival_date) if @search.arrival_date.is_a?(String)
      @search.departure_date = Date.parse(@search.departure_date) if @search.departure_date.is_a?(String)

      @islands = @islands.joins(:bookings)
                      .where.not(bookings: { status: 'cancelled' })
                      .where('bookings.start_date < ? AND bookings.end_date > ?', @search.departure_date, @search.arrival_date)
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
