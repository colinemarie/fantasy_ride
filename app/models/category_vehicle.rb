class CategoryVehicle < ApplicationRecord
  belongs_to :vehicle
  belongs_to :category
end
