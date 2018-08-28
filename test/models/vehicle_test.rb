require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @vehicle_valid = Vehicle.new(
      registration: "VIC123", 
      body: "Sedan", 
      make: "Honda",
      model: "Civic",
      odometer: "2002",
      year: "2017",
      colour: "Blue",
      status: "Available"
      )
  end
  
  test "Vehicle should be valid" do
    assert @vehicle_valid.valid?
  end
  
  test "registration should be present" do
    @vehicle_valid.registration = "     "
    assert_not @vehicle_valid.valid?
  end
  
  test "registration too short" do
    @vehicle_valid.registration = "A" * 5
    assert_not @vehicle_valid.valid?
  end
  
  test "registration too long" do
    @vehicle_valid.registration = "A" * 7
    assert_not @vehicle_valid.valid?
  end
  
  test "registration reject if not 6 letters or isn't digits and capital letters only" do
    invalid_regos = %w[aaa123 Aaa123 "aa-aaa" 1234567 123s45]
    invalid_regos.each do |invalid_rego|
      @vehicle_valid.registration = invalid_rego
      assert_not @vehicle_valid.valid?, "#{invalid_rego.inspect} should be invalid"
    end
  end
  
  test "body should be present" do
    @vehicle_valid.body = "     "
    assert_not @vehicle_valid.valid?
  end
  
  test "make should be present" do
    @vehicle_valid.make = "     "
    assert_not @vehicle_valid.valid?
  end
  
  test "model should be present" do
    @vehicle_valid.model = "     "
    assert_not @vehicle_valid.valid?
  end
  test "odometer should be present" do
    @vehicle_valid.odometer = "     "
    assert_not @vehicle_valid.valid?
  end
  
  test "year should be present" do
    @vehicle_valid.year = nil
    assert_not @vehicle_valid.valid?
  end
  
  test "colour should be present" do
    @vehicle_valid.colour = "     "
    assert_not @vehicle_valid.valid?
  end
  
  test "status should be present" do
    @vehicle_valid.status = "     "
    assert_not @vehicle_valid.valid?
  end
end
