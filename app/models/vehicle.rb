class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :categories_vehicles
  has_many :categories, through: :categories_vehicles
  has_many_attached :photos

  validates :name, :price_per_day, :description, :address, :capacity, :minimum_age, :photos, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unavailable_dates
    reservations.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
