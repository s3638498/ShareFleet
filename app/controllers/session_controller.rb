class SessionController < ApplicationController
    
    def new
      render 'login'
    end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in @user
      #redirect_to user
      redirect_to :controller => 'users', :action => 'show', :id => @user.id
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
