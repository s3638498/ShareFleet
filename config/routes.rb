Rails.application.routes.draw do

  resources :messages
  #route to root
  root 'main#home'

  
  #User add, edit and login
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/login',  to: 'session#destroy'
  get   '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  patch "/edit", :to => 'users#update'
  
  #Vehicle
  get   '/addvehicle',  to: 'vehicles#new'
  patch "/editvehicle", to: 'vehicles#update'
  patch "/deletevehicle", to: 'vehicles#destroy'
  
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
  end
  #Vehicle resource
  resources :vehicles
  #Location resources
  resources :locations
end
