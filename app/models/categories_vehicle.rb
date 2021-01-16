class CategoriesVehicle < ApplicationRecord
  belongs_to :category
  belongs_to :vehicle
end
