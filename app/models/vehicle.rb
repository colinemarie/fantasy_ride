class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :categories_vehicles
  has_many :categories, through: :categories_vehicles
  has_many_attached :photos
  validates :name, :price_per_day, :description, :address, :capacity, :minimum_age, presence: true
end
