class Location < ApplicationRecord
  #Testing Geocoding by Address, result: With the default geocoder API, it is very inaccurate, more accurate to use the Coordinates.
  #geocoded_by :address
  #after_validation :geocode
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  HUMANIZED_ATTRIBUTES = {
    :num_park => "Parking space"
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  validates :name, presence: true, uniqueness: true
  validates :num_park, presence: true, numericality: { greater_than: 0 }
  validates :latitude, presence: true
  validates :longitude, presence: true
end