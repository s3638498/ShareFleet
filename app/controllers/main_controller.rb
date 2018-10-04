class MainController < ApplicationController
  before_action do 
    ActiveStorage::Current.host = request.base_url
    end



  def home
    gon.locations = Location.all
    gon.vehicles = Vehicle.all
    gon.vehicle_images = Hash.new

    Vehicle.all.each do |v|
      gon.vehicle_images[v.id] = v.image_attachment.try(:service_url)

      end
  end
end
