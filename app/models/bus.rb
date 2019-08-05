class Bus < ApplicationRecord
  # -------------------- Association --------------------
  belongs_to :bus_owner
  has_many :reservations
  # -------------------- Validations --------------------
  validates :name, :registration_no, :total_no_of_seats, :source, :destination, presence:true
end
