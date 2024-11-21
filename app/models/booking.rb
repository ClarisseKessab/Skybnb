class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :island_id, presence: true
  validates :user_id, presence: true
  validates :travellers, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :paid_price, numericality: {
    greater_than_or_equal_to: 0.0,
    allow_nil: true # Permettre que le champ soit nil
  }

  enum status: { pending: 'pending', confirmed: 'confirmed', cancelled: 'cancelled' }
end
