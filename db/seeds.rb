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


Vehicle.create!(
  registration: "VIC001", 
  body: "Sedan", 
  make: "Honda",
  model: "Civic",
  odometer: "2002",
  year: "2017",
  colour: "Blue",
  status: "Available"
  )
  
Vehicle.create!(
  registration: "VIC002", 
  body: "Hatch", 
  make: "Toyota",
  model: "Corolla",
  odometer: "212121",
  year: "2016",
  colour: "White",
  status: "Available"
  )
  
Vehicle.create!(
  registration: "VIC003", 
  body: "Ute", 
  make: "Ford",
  model: "Ranger",
  odometer: "1123",
  year: "2013",
  colour: "Black",
  status: "Available"
  )
  
Vehicle.create!(
  registration: "VIC004", 
  body: "Hatch", 
  make: "Mazda",
  model: "Nep",
  odometer: "63535",
  year: "2011",
  colour: "White",
  status: "Available"
  )
  
Vehicle.create!(
  registration: "VIC005", 
  body: "Hatch", 
  make: "Hyundai",
  model: "Getz",
  odometer: "8943",
  year: "2008",
  colour: "Pink",
  status: "Available"
  )
  
  
Location.create!(
  name: "City Bath", 
  num_park: "3",
  latitude: "-37.807364",
  longitude: "144.963362"
  )
  
Location.create!(
  name: "Orr st", 
  num_park: "2",
  latitude: "-37.806682",
  longitude: "144.965143"
  )
  
Location.create!(
  name: "Bowen st", 
  num_park: "1",
  latitude: "-37.809236",
  longitude: "144.964877"
  )
  
Location.create!(
  name: "Russell st", 
  num_park: "1",
  latitude: "-37.809422",
  longitude: "144.966486"
  )
  

Location.create!(
  name: "Swanston st", 
  num_park: "1",
  latitude: "-37.810600",
  longitude: "144.964238"
  )