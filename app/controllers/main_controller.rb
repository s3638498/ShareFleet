class MainController < ApplicationController
  def home
    gon.locations = Location.all
  end
end
