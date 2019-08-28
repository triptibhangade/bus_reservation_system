class Bus < ApplicationRecord
  # -------------------- Association --------------------
  belongs_to :bus_owner
  has_many :reservations, dependent: :destroy
  has_many :seats,
            through: :reservations, dependent: :destroy
            
  # -------------------- Validations --------------------
  validates :name, :registration_no, :source, :destination, presence:true
  validate :total_no_of_seats_is_divided_by_four

  private
    def total_no_of_seats_is_divided_by_four
      if total_no_of_seats.blank?
        errors.add(:total_no_of_seats, "seats can\'t be blank")
      elsif !(total_no_of_seats%4==0)
        errors.add(:total_no_of_seats, "please give proper number of seats")
      end
    end
end
