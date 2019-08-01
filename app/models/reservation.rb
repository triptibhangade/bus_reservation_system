class Reservation < ApplicationRecord
  belongs_to :bus
  belongs_to :user

  validates :reservation_date, presence:true
  validates :seat, presence:true

end