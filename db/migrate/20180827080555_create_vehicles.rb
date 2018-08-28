class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :registration
      t.string :body
      t.string :make
      t.string :model
      t.integer :odometer
      t.string :year
      t.string :colour
      t.string :status

      t.timestamps
    end
  end
end
