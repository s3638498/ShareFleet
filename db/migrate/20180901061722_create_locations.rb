class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :num_park
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
