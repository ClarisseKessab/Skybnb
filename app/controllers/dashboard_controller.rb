class DashboardController < ApplicationController

  def index
    # On veut voir nos prochains voyages
    @guest_bookings = current_user.bookings

    # On veut voir nos demandes de réservation
    @owner_bookings = Booking.joins(:island).where(islands: { user_id: current_user.id })

    # On veut voir nos îles en tant que propriétaire
    @islands = Island.where(user: current_user)
  end
end
