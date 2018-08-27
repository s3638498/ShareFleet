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
      status: "Available",
      )
  end
  test "should be valid" do
    assert @vehicle_valid.valid?
  end
end
