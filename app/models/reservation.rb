class Reservation < ApplicationRecord
  # -------------------- Associations --------------------
  belongs_to :bus
  has_many :seats, dependent: :destroy 
  belongs_to :reservable, polymorphic: true
  # -------------------- validations --------------------
  validates :reservation_date, presence:true
  validates :seat, presence:true
end
