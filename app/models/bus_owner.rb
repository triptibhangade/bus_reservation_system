class BusOwner < ApplicationRecord

  # -------------------- Device --------------------

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  # -------------------- Status of Bus Owner --------------------
  enum status: {active: "active", pending: "pending", suspend: "suspend", ignore: "ignore" }
  # -------------------- Associations --------------------
  has_many :buses
  has_many :reservations
  # -------------------- Validations --------------------
  validates :name, :license, :gst_no, presence:true
end
