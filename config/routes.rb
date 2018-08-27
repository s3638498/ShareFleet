Rails.application.routes.draw do

  #route to root
  root 'main#home'

  match '/signup', to: 'users#signup', via: :all
  
  #login
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/login',  to: 'session#destroy'
  
  #Vehicle resource
  
end
