class VehiclesController < ApplicationController
  before_action :admin_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

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
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      flash[:success] = "Successfully added vehicle!"
      redirect_to :controller => 'vehicles', :action => 'show', :id => @vehicle.id
    else
      render :new
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Vehicle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
    redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'
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
