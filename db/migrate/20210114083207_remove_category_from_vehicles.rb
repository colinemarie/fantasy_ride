class RemoveCategoryFromVehicles < ActiveRecord::Migration[6.0]
  def change
    remove_column :vehicles, :category, :string
  end
end
