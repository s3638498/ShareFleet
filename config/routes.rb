Rails.application.routes.draw do


  get 'password_resets/new'
  get 'password_resets/edit'
  get 'invitations/new'
  #route to root
  root 'main#home'


  #User add, edit and login
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/login',  to: 'session#destroy'
  get   '/signup',  to: 'users#new'
  get   '/bookingHistory',  to: 'users#bookingHistory'
  post  '/signup',  to: 'users#create'
  patch "/edit", :to => 'users#update'

  #Vehicle
  get   '/addvehicle',  to: 'vehicles#new'
  patch "/editvehicle", to: 'vehicles#update'
  patch "/deletevehicle", to: 'vehicles#destroy'
  put "/setStatusPickup", to: 'vehicles#setStatusPickup'
  put "/setStatusAvailable", to: 'vehicles#setStatusAvailable'

  #Location
  patch "/deletelocation", to: 'locations#destroy'
  put "/assigntolocation", to: 'locations#assignvehicletolocation'
  put "/deletefromlocation", to: 'locations#removevehiclefromlocation'


  resources :locations do
    member do
      get 'assignvehicle'
    end
  end

  #Users resource
  resources :users do
    member {patch :reactivate}
    member {patch :deactivate}
    #messages under users for RESTful approach
    resources :messages
  end
  #Vehicle resource
  resources :vehicles
  #Location resources
  resources :locations
  #Booking resources
  resources :bookings

  #Reset Password
  resources :password_resets,     only: [:new, :create, :edit, :update]
  #invitation
  resources :invitations,     only: [:new, :create, :edit, :update]
end
