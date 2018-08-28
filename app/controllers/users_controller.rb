class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def signup
    
  end
  
  # GET /users
  def index
    @users = Enduser.all
  end

  # GET /users/1
  def show
    @user = Enduser.find(params[:id])
  end

  # GET /users/new
  def new
    @user = Enduser.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = Enduser.new(user_params)

    if @user.save
      flash[:success] = "Successfully created account!"
      redirect_to root_url
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def user_params
      params.require(:enduser).permit(:username,:password, :password_confirmation,:first_name,:last_name,:date_of_birth,:email,:contact_number,:address,:driver_licence)
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
