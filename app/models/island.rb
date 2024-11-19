class Island < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :location, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :gps_longitude, presence: true, format: { with: /\A[-+]?\d{1,3}\.\d+\z/, message: "must be a valid longitude" }
  validates :gps_latitude, presence: true, format: { with: /\A[-+]?\d{1,2}\.\d+\z/, message: "must be a valid latitude" }
end
