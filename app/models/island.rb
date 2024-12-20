class Island < ApplicationRecord
  extend Geocoder::Model::ActiveRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :location, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :gps_longitude, presence: true
  validates :gps_latitude, presence: true

  geocoded_by :location
end
