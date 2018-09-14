=begin
    Author: Ryan Tran
    Student number: s3201690

    Vehicle controller methods
=end

class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
  before_action :admin_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_vehicle, only: [:update, :destroy]
  before_action :getConstants, only: [:index, :show, :new, :create, :edit, :update, :destroy]
 
  # GET /vehicles
  def index
    @vehicles = Vehicle.all.order(:registration)
  end

  # GET /vehicles/1
  def show
    @vehicle = Vehicle.find(params[:id])
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
  end
  
  # PATCH/PUT /vehicles/1
  def setStatusPickup
    @booking = Booking.find(params[:id])
    @vehicle = @booking.vehicle
    @vehicle.update(:status => "Pickedup")
    redirect_to :controller => 'users', :action => 'show', :id => @booking.user.id
  end
  
  def setStatusAvailable
    @booking = Booking.find(params[:id])
    @vehicle = @booking.vehicle
    @vehicle.update(:status => "Available")
    redirect_to :controller => 'users', :action => 'show', :id => @booking.user.id
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:success] = "Successfully added vehicle!"
      redirect_to :controller => 'vehicles', :action => 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      flash[:success] = "Successfully updated vehicle!"
      redirect_to :action => 'edit', :id => @vehicle.id
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  def destroy
    if @vehicle.status != "Pickedup"
      @vehicle.destroy
      flash[:success] = "Deleted vehicle!"
      redirect_to :controller => 'vehicles', :action => 'index'
    else
      flash[:danger] = "Vehicle is currently booked, unable to delete!"
      render :edit
    end
  end

  private
    def vehicle_params
      params.require(:vehicle).permit(:registration,:body,:make,:model,:odometer,:year,:colour,:status,:image)
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
    
    def getConstants
      @BODYTYPE = ["Ute", "Sedan", "Hatch", "SUV"]
      @STATUSES = [ "Available", "Pickedup", "Service" ]
    end
end
