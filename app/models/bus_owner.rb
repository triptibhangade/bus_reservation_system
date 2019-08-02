class BusOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: {active: "active", pending: "pending", suspend: "suspend", ignore: "ignore" }

  has_many :buses
  has_many :reservations, :through => :buses

  validates :name, :license, :gst_no, presence:true

end
