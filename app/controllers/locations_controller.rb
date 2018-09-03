=begin
    Author: Ryan Tran
    Student number: s3201690

    Locations controller methods
=end


class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
  before_action :admin_user, only: [:index, :show, :new, :create, :edit, :update, :destroy, :assignvehicletolocation, :removevehiclefromlocation, :assignvehicle]
  before_action :assignValues, only: [:assignvehicletolocation, :removevehiclefromlocation]
  
  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all.order(:name)
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(allowed_params)
    if @location.save
      flash[:success] = "Successfully added Parking location!"
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(allowed_params)
      flash[:success] = "Successfully updated Parking location!"
      redirect_to :action => 'edit', :id => @location.id
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.vehicles.count == 0
      @location.destroy
      flash[:success] = "Successfully deleted Parking location!"
      redirect_to locations_url
    else
      flash[:danger] = "There are still vehicles located here."
      redirect_to :action => 'edit', :id => @location.id
    end
  end
  
  def assignvehicle
    @location = Location.find(params[:id])
    @vehicles = Vehicle.all.order(:registration)
    @vecCurrentLocation = @location.vehicles
    @vehiclesAvailable = @vehicles - @vecCurrentLocation
  end
  
  def assignvehicletolocation
    if @vehicle.status == "Available"
      if @location.num_park > @location.vehicles.count
        flash[:success] = "Vehicle has been assigned to this location."
        @location.vehicles << @vehicle
      else
        flash[:danger] = "No spaces available."
      end
    else
      flash[:danger] = "Vehicle is not ready to be assigned."
    end
    redirect_to :action => 'assignvehicle', :id => @location.id
  end
  
  def removevehiclefromlocation
    if @vehicle.status == "Available"
        flash[:success] = "Vehicle has been removed from this location."
        @location.vehicles.delete(@vehicle)
    else
      flash[:danger] = "Vehicle is not ready to be removed."
    end
    redirect_to :action => 'assignvehicle', :id => @location.id
  end

  private
  def assignValues
    @location = Location.find(params[:locid])
    @vehicle = Vehicle.find(params[:vecid])
  end

  def allowed_params
    params.require(:location).permit(:id, :address, :latitude, :longitude,:name,:num_park)
  end
end