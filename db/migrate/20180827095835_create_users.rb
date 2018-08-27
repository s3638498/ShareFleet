class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_checksum
      t.string :type
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :contact_number
      t.string :address
      t.string :driver_licence

      t.timestamps
    end
  end
end
