class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :destroy]
  before_action :admin_user,     only: [:index, :destroy, :deactivate, :reactivate]

  # GET /users
  def signup
    @users = Enduser.all
  end

  # GET /users
  def index
    @users = Enduser.all
  end

  # GET /users/1
  def show
    now = DateTime.now
    @user = Enduser.find(params[:id])
    bookings = @user.bookings.order('pickup_time')
    bookings.each do |book|
      if now.between?(book.pickup_time, book.expected_dropoff_time)
        @upcomingBooking = book
        break
      end
    end
    
  end

  def bookingHistory
    @user = Enduser.find(params[:id])
    @bookings = @user.bookings.order('pickup_time')
  end

  # GET /users/new
  def new
    @user = Enduser.new
    if !params[:referer].blank?
      @referer = params[:referer]
    end
  end

  # GET /users/1/edit
  def edit
    @user = Enduser.find(params[:id])
  end

  # POST /users
  def create
    @user = Enduser.new(user_params)

    if @user.save
      if !params[:referer].blank? && !Enduser.where(email: params[:referer]).nil?
        flash[:success] = "Successfully created account, promotional code sent!"
      else
        flash[:success] = "Successfully created account!"
      end
      log_in @user
      redirect_to :controller => 'users', :action => 'show', :id => @user.id
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated account!"
      redirect_to :controller => 'users', :action => 'edit', :id => @user.id
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  #Deactivate account
  def deactivate
      @user = Enduser.find(params[:id])
      if @user.update_attributes(locked:true)
      redirect_to users_path
      else
      flash[:danger] = "Error deactivate account"
      redirect_to(root_url)
      end
  end

  #Reactivate account
  def reactivate
      @user = Enduser.find(params[:id])
      if @user.update(locked: false)
      redirect_to users_path
      else
      flash[:danger] = "Error reactivate account"
      redirect_to :back
      end
  end

  private
    def user_params
      params.require(:enduser).permit(:username,:password, :password_confirmation,:first_name,:last_name,:date_of_birth,:email,:contact_number,:address,:driver_licence,:locked)
    end


    # Before filters
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
