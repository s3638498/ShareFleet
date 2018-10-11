class AddRateToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :rate, :float
  end
end
