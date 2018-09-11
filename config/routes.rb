Rails.application.routes.draw do

  #route to root
  root 'main#home'

  #sign up
  get '/signup',     to: 'users#signup'
  get '/login',      to: 'users#login'
  
  #login
end
