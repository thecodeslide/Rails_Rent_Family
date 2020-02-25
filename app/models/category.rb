class Category < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, presence: true
  validates :price, presence: true,  numericality: { only_integer: false }
end
