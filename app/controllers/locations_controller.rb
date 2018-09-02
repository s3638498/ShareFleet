class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
  before_action :admin_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
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
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:success] = "Successfully deleted Parking location!"
    redirect_to locations_url
  end

  private

  def allowed_params
    params.require(:location).permit(:id, :address, :latitude, :longitude,:name,:num_park)
  end
end