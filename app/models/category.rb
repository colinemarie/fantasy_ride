class Category < ApplicationRecord
  has_many :categories_vehicles
  has_many :vehicles, through: :categories_vehicles
end
