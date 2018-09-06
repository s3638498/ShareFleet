class AddLocationToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_reference :vehicles, :location, foreign_key: true
  end
end
