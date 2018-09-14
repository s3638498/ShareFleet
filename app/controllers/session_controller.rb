class SessionController < ApplicationController
    
    def new
      render 'login'
    end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password]) && user.locked == false
      # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      
      
      if user.is_a? Enduser
        redirect_to :controller => 'users', :action => 'show', :id => user.id
      else
        redirect_back_or root_url
      end
    else if user && user.authenticate(params[:session][:password]) && user.locked == true
      flash.now[:warning] = "Account has been locked, please contact Share Fleets."
      render 'login'
    else
      # Create an error message.
      flash.now[:warning] = "Invalid username/password combination"
      render 'login'
    end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
