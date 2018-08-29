class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
  before_action :admin_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_vehicle, only: [:update, :destroy]
 

  # GET /vehicles
  def index
    @vehicles = Vehicle.all
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
      render :edit
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
    flash[:success] = "Deleted vehicle!"
    redirect_to :controller => 'vehicles', :action => 'index'
  end

  private
    def vehicle_params
      params.require(:vehicle).permit(:registration,:body,:make,:model,:odometer,:year,:colour,:status,:image)
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.class.name == "Administrator"
    end
end
