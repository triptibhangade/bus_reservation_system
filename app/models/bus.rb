class Bus < ApplicationRecord
  belongs_to :bus_owner
  has_many :reservations
end
