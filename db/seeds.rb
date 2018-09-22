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


veca = Vehicle.create!(
  registration: "VIC001", 
  body: "Sedan", 
  make: "Honda",
  model: "Civic",
  odometer: "2002",
  year: "2017",
  colour: "Blue",
  status: "Available"
  )
  
vecb = Vehicle.create!(
  registration: "VIC002", 
  body: "Hatch", 
  make: "Toyota",
  model: "Corolla",
  odometer: "212121",
  year: "2016",
  colour: "White",
  status: "Available"
  )
  
vecc = Vehicle.create!(
  registration: "VIC003", 
  body: "Ute", 
  make: "Ford",
  model: "Ranger",
  odometer: "1123",
  year: "2013",
  colour: "Black",
  status: "Available"
  )
  
vecd = Vehicle.create!(
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
  
(1..9).each do |n|
  Vehicle.create!(
    registration: "VIC0#{n}0", 
    body: "Hatch", 
    make: "Hyundai",
    model: "Getz",
    odometer: "#{n}943",
    year: "200#{n}",
    colour: "Pink",
    status: "Available"
    )
end
  
parka = Location.create!(
  name: "City Bath", 
  num_park: "3",
  address: "420 Swanston St, Melbourne VIC 3000"
  )
  
parkb = Location.create!(
  name: "Orr st", 
  num_park: "2",
  address: "8-14 Orr St Carlton VIC 3053"
  )
  
Location.create!(
  name: "Bowen st", 
  num_park: "1",
  address: "Bowen St Melbourne VIC 3000"
  )
  
Location.create!(
  name: "Russell st", 
  num_park: "1",
  address: "308 Russell St, Melbourne VIC 3000"
  )
  

Location.create!(
  name: "Swanston st", 
  num_park: "1",
  address: "394 Swanston St, Melbourne VIC 3000"
  )
  
parka.vehicles << vecd
parka.vehicles << vecc

parkb.vehicles << veca
parkb.vehicles << vecb

datetime = DateTime.now
booking1 = Booking.new(
  pickup_time: (datetime + 1.hours),
  expected_dropoff_time: (datetime + 6.hours)
  )
booking1.user = Enduser.first
booking1.vehicle = vecb
booking1.save

datetime = DateTime.now + 10.days
booking2 = Booking.new(
  pickup_time: (datetime + 1.hours),
  expected_dropoff_time: (datetime + 6.hours)
  )
booking2.user = Enduser.last
booking2.vehicle = veca
booking2.save

datetime = DateTime.now + 1.weeks
booking3 = Booking.new(
  pickup_time: (datetime + 1.hours),
  expected_dropoff_time: (datetime + 6.hours)
  )
booking3.user = Enduser.second
booking3.vehicle = veca
booking3.save

#Testing Dashboard
locateAddress = Location.create!(
  name: "Canning", 
  num_park: "3",
  address: "296 Canning St Carlton North VIC 3054"
  )

vec = Vehicle.create!(
  registration: "VICABC", 
  body: "Hatch", 
  make: "Hyundai",
  model: "Getz",
  odometer: "8943",
  year: "2008",
  colour: "Pink",
  status: "Available"
  )

locateAddress.vehicles << vec

datetime = DateTime.now
booking4 = Booking.new(
  pickup_time: (datetime + 1.seconds),
  expected_dropoff_time: (datetime + 6.hours)
  )
booking4.user = Enduser.first
booking4.vehicle = vec
booking4.save