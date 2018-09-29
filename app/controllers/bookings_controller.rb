class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :new, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all.order('pickup_time')
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    
    #Testing
    @vehicle = Vehicle.last
    @user = current_user
    @bookingHistory = @vehicle.bookings.where("pickup_time >= ?", DateTime.now)
    
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)
    @user = Enduser.find(params[:user])
    @vehicle = Vehicle.find(params[:vehicle])
    @booking.user = @user
    @booking.vehicle = @vehicle
    
    if @booking.save
      flash.now[:success] = "Successfully made a booking!"
      redirect_to controller: "users", action: "bookingHistory", id: current_user
    else
      flash[:warning] = "Unable to make a booking, Please select a time period!"
      redirect_to booking_url
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:pickup_time,:expected_dropoff_time,:total)
    end
end
