class MainController < ApplicationController
  def home
    gon.locations = Location.all
    gon.vehicles = Vehicle.all
  end
end
