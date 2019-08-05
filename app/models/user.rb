class User < ApplicationRecord

  # -------------------- Device--------------------

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  # -------------------- Role Of User --------------------
  enum role: {admin: "admin", customer: "customer"}
  # -------------------- Associations --------------------
  has_many :reservations
  # -------------------- Validations --------------------
  validates :name, presence:true
end
