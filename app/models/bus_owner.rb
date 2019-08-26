class BusOwner < ApplicationRecord

  # -------------------- Device --------------------

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # -------------------- Status of Bus Owner --------------------
  enum status: {active: "active", pending: "pending", ignore: "ignore" }
  # -------------------- Associations --------------------
  has_many :buses
  has_many :reservations, as: :reservable

  # -------------------- Validations --------------------
  validates :name, :license, :gst_no, presence:true
end
