class Seat < ApplicationRecord
  # -------------------- Associations --------------------
  belongs_to :reservation
  # -------------------- Validations --------------------
  validates :seat_no, presence:true
end
