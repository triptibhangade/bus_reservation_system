class Reservation < ApplicationRecord
  # -------------------- Associations --------------------
  belongs_to :bus
  has_many :seats
  # -------------------- validations --------------------
  validates :reservation_date, presence:true
  # validates :seat, presence:true

  def build_seat
    (1..16).each do |seat|
      self.seats.build(seat_no: seat)
    end
  end
end
