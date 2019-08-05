class Reservation < ApplicationRecord
  # -------------------- Associations --------------------
  belongs_to :bus
  belongs_to :users
  # -------------------- validations --------------------
  validates :reservation_date, presence:true
  validates :seat, presence:true
end