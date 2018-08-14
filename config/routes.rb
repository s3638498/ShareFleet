Rails.application.routes.draw do

  #route to root
  root 'main#home'

  #sign up
  get '/signup',     to: 'users#signup'
  # get '/login',      to: 'users#login'
  
  #login
  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/login',  to: 'session#destroy'
end
