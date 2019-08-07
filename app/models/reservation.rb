class Reservation < ApplicationRecord
  # -------------------- Associations --------------------
  belongs_to :bus
  # -------------------- validations --------------------
  validates :reservation_date, presence:true
  validates :seat, presence:true

end