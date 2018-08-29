Rails.application.routes.draw do

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
  patch "/editvehicle", :to => 'vehicles#update'
  patch "/deletevehicle", to: 'vehicles#destroy'
  
  #Users resource
  resources :users
  #Vehicle resource
  resources :vehicles
end
