class Seat < ApplicationRecord
  belongs_to :reservation

  validates :seat_no, presence:true
end
