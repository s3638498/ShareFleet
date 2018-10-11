require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  require 'date'
  require 'active_support/time'
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @enduser = Enduser.new(
      username: "tony",
      password: "Password!23", 
      password_confirmation: "Password!23",
      first_name: "Tony", 
      last_name: "Mao", 
      date_of_birth: "2018-01-01",
      email: "tony@example.com",  
      contact_number: "0422532706",
      address: "123 fake st",
      driver_licence: "047384773")
    
    @vehicle = Vehicle.new(
      registration: "VIC123", 
      body: "Sedan", 
      make: "Honda",
      model: "Civic",
      odometer: "2002",
      year: "2017",
      colour: "Blue",
      status: "Available",
      rate: "9.50")
      
    @location = Location.new(
      name: "Test st", 
      num_park: "1",
      latitude: "-37.809236",
      longitude: "144.964877")
      
    @location.vehicles << @vehicle
    
    datetime = DateTime.now
    pickup_time= (datetime + 1.hours)
    expected_dropoff_time= (datetime + 6.hours)
    total_booking_time= (((expected_dropoff_time - pickup_time) * 24 * 60).to_f/60)
    @booking = Booking.new(
      pickup_time: pickup_time,
      expected_dropoff_time: expected_dropoff_time
      )
    
    @booking.user =  @enduser
    @booking.vehicle = @vehicle
    @booking.total = total_booking_time * @booking.vehicle.rate
  end
  
  test "Booking should be valid" do
    assert @booking.valid?
  end
  
  test "Booking pickup should not be after expected drop off" do
    datetime = DateTime.now
    @booking.pickup_time = datetime + 1.second
    @booking.expected_dropoff_time = datetime
    assert_not @booking.valid?
  end
  
  test "Booking expected drop off should not be before pickup" do
    datetime = DateTime.now
    @booking.pickup_time = datetime
    @booking.expected_dropoff_time = datetime - 1.second
    assert_not @booking.valid?
  end
  
  test "Booking pickup should not be in the past" do
    datetime = DateTime.now + 5.hours
    @booking.pickup_time = datetime - 10.hours
    @booking.expected_dropoff_time = datetime + 1.second
    assert_not @booking.valid?
  end
  
  test "Booking should have a user" do
    @booking.user = nil
    assert_not @booking.valid?
  end
  
  test "Booking should have a vehicle" do
    @booking.vehicle = nil
    assert_not @booking.valid?
  end
end
