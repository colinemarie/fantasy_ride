class CreateJoinTableCategoryVehicle < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :vehicles do |t|
      # t.index [:category_id, :vehicle_id]
      # t.index [:vehicle_id, :category_id]
    end
  end
end
