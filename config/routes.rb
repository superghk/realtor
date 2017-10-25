Rails.application.routes.draw do

  get 'listings/show'

  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to:'sessions#new'
  get '/login',	 to: 'sessions#create'
  get '/addlistings',	to: 'houses#new'
  
  
  delete '/logout',  to: 'sessions#destroy'
  
  post '/signup',  to: 'users#create'
  post '/login',	  to: 'sessions#create'
  post '/addlistings', to: 'houses#create'
  resources :users
  resources :houses
  resources :notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
