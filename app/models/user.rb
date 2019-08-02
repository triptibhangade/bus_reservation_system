class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  enum role: {admin: "admin", customer: "customer"}

  has_many :reservations
  # has_many :seats, :through => :reservations


  validates :name, presence:true

end
