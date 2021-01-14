class CategoryVehicle < ApplicationRecord
  has_one :vehicle
  has_one :category
end
