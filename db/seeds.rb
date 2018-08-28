# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(1..5).each do |n|
  Enduser.create!(
      username: "testaccount#{n}",
      password: "Password!23", 
      password_confirmation: "Password!23",
      first_name: "Test#{n}", 
      last_name: "Account#{n}", 
      date_of_birth: "199#{n}-01-01",
      email: "testaccount#{n}@example.com",  
      contact_number: "041234567#{n}",
      address: "20#{n} fake st",
      driver_licence: "09876543#{n}")
end

Administrator.create!(username: "admin", password: "Password!23")
  