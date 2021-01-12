class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, :price_per_day, :description, :address, :capacity, :minimum_age, presence: true
  validates :category, inclusion: { in: %w[sea air wheels animal time] }
  has_many_attached :photos
end
