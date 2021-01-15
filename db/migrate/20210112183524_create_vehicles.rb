class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :price_per_day
      t.text :description
      t.text :address
      t.integer :capacity
      t.integer :minimum_age
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
