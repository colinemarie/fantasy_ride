class AddDurationToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :duration, :integer
  end
end
