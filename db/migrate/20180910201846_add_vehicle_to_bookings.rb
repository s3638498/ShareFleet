class AddVehicleToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :vehicle, foreign_key: true
  end
end
