=begin
    Author: Ryan Tran
    Student number: s3201690

    Vehicle model and validation
=end

class Location < ApplicationRecord
  #Testing Geocoding by Address, result: With the default geocoder API, it is very inaccurate, more accurate to use the Coordinates.
  has_many :vehicles
  
  #geocoded_by :address
  #reverse_geocoded_by :latitude, :longitude
  #after_validation :geocode, :reverse_geocode
  
  #reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode
  
  geocoded_by :address
  after_validation :geocode
  
  HUMANIZED_ATTRIBUTES = {
    :num_park => "Parking space"
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  validates :name, presence: true, uniqueness: true
  validates :num_park, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  #validates :latitude, presence: true
  #validates :longitude, presence: true
end