class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :contact_number
      t.string :email
      t.string :address
      t.string :driver_licence
    end
  end
end
