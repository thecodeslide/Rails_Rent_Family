class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :categories
  has_many :bookings
  validates :first_name, :last_name, :location, :gender, :status, presence: true
  validates :age, presence: true,  numericality: { only_integer: true }
end
