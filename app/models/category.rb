class Category < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, presence: true
  validates :price, presence: true,  numericality: { only_integer: false }
  CATEGORIES = ["Grandpa/Grandma", "Teenager", "Child", "University", "Father", "Mother", "Brother", "Sister"]
  has_one_attached :photo
end
