class Bus < ApplicationRecord
  # -------------------- Association --------------------
  belongs_to :bus_owner
  has_many :reservations
  has_many :seats,
            through: :reservations, dependent: :destroy
  # -------------------- Validations --------------------
  validates :name, :registration_no, :total_no_of_seats, :source, :destination, presence:true

  def self.search(source_search, destination_search)
    where("source LIKE :source OR destination = :destination",
        {:source => "%#{source_search}%", :destination => "%#{destination_search}%"})
  end
end
