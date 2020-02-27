class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  GENDER = ["Male", "Female"]
  PERSONALITY = ["movie", "reading", "chatting", "walk", "sightsee", "eating", "skiing", "sleeping", "scubadiving", "extreme sports", "cooking", "drinking" ]
  has_many :categories
  has_many :bookings
  has_many :bookings_as_service, through: :categories, source: :bookings
  validates :first_name, :last_name, :location, :gender, presence: true
  validates :age, presence: true,  numericality: { only_integer: true }
  has_one_attached :photo
end
