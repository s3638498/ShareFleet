=begin
    Author: Ryan Tran
    Student number: s3201690

    Unit testing for Locations
=end

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(
    name: "Test st", 
    num_park: "1",
    address: "375 Cardigan St Carlton VIC 3053"
    )
  end
  
  test "Location should be valid" do
    assert @location.valid?
  end
  
  test "Location name should be present" do
    @location.name = nil
    assert_not @location.valid?
  end
  
  test "Location name should be unique" do
    duplicate_location = @location.dup
    @location.save
    assert_not duplicate_location.valid?
  end
  
  test "Location num_park should be present" do
    @location.num_park = nil
    assert_not @location.valid?
  end
  
  test "Location num_park less than 1 should be invalid" do
    @location.num_park = 0
    assert_not @location.valid?
  end
  
  test "Address should be present" do
    @location.address = nil
    assert_not @location.valid?
  end
end
