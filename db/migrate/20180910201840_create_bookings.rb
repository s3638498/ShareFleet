class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :pickup_time
      t.datetime :expected_dropoff_time
      t.datetime :dropoff_time
      t.boolean :payment_received

      t.timestamps
    end
  end
end
