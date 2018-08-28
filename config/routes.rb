Rails.application.routes.draw do

  #route to root
  root 'main#home'

  
  #login
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/login',  to: 'session#destroy'
  
  get   '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  
  patch "/edit", :to => 'users#update'
  
  #Users resource
  resources :users
  #Vehicle resource
  
end
