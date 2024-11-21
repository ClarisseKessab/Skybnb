class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :island_id, presence: true
  validates :user_id, presence: true

  # On vérifie que les dates sont disponibles et que la capacité est respectée
  validate :dates_available
  validate :travellers_within_capacity

  validates :travellers, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :paid_price, numericality: {
    greater_than_or_equal_to: 0.0,
    allow_nil: true # Permettre que le champ soit nil
  }

  enum status: { pending: 'pending', confirmed: 'confirmed', cancelled: 'cancelled' }
  attr_accessor :date_range



  private

  def dates_available
    overlapping_bookings = Booking.where(island_id: island_id)
                                  .where.not(id: id)
                                  .where('start_date < ? AND end_date > ?', end_date, start_date)
    if overlapping_bookings.exists?
      errors.add(:base, 'The selected dates are not available for this island.')

    end
  end

  def travellers_within_capacity
    if travellers > island.capacity
      errors.add(:travellers, "cannot exceed the island's capacity of #{island.capacity}.")
    end
  end
end
