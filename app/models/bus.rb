class Bus < ApplicationRecord
  belongs_to :bus_owner
  has_many :reservations

  validates :name, :registration_no, :total_no_of_seats, :source, :destination, presence:true


  


end
