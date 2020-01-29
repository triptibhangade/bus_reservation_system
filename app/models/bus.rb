class Bus < ApplicationRecord
  # ----------------------------------------- Association -----------------------------------------
  belongs_to :bus_owner
  has_many :reservations, dependent: :destroy
  has_many :seats,
            through: :reservations, dependent: :destroy

  # ------------------------------------- Status of Bus Owner -------------------------------------
  enum status: {active: "active", suspend: "suspend" }

  # ----------------------------------------- Validations -----------------------------------------
  validates :name, :registration_no, :source, :destination, presence:true
  validates :source, presence: true, format: { with: /\A[a-z A-Z]+\z/,
              message: "only allows capital letters" }
  validate :total_no_of_seats_is_divided_by_four
  
  # -------------------------------------------- Search --------------------------------------------
  scope :filter_by_source, -> (source) { where(source: source) }
  # def self.filter_by_source(source)
    # where(source: source)
  # end

  scope :filter_by_destination, -> (destination) { where(destination: destination) }
  # def self.filter_by_destination(destination)
  #   where(destination: destination)
  # end

  scope :filter_by_source_and_destination, -> (source, destination) { filter_by_source(source).filter_by_destination(destination) }

  def self.filter_by_source_and_destination(source, destination)
    filter_by_source(source).filter_by_destination(destination)
  end

  private
    def total_no_of_seats_is_divided_by_four
      if total_no_of_seats.blank?
        errors.add(:total_no_of_seats, "seats can\'t be blank")
      elsif !(total_no_of_seats%4==0)
        errors.add(:total_no_of_seats, "please give proper number of seats")
      end
    end
end
