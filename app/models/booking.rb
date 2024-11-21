class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  attr_accessor :date_range
end
