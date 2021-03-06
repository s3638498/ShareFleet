class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  def new
  end

  def create
    @user = Enduser.find_by(email: params[:password_reset][:email])
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent! Please check your email for password reset instructions!"
      redirect_to login_path
    else
      flash.now[:danger] = "Email address not found, please try again."
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:enduser][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to login_path
    else
      render 'edit'
    end
  end
 
  private
    def user_params
      params.require(:enduser).permit(:password, :password_confirmation)
    end
  
    def get_user
     @user = Enduser.find_by(email: params[:email])
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
