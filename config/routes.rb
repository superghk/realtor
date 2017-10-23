Rails.application.routes.draw do

  root 'pages#home'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to:'sessions#new'
  get '/login',	 to: 'sessions#create'
  get '/mylisting', to: 'houses#show'
  get '/addlistings',	to: 'houses#new'
  
  delete '/logout',  to: 'sessions#destroy'
  
 
  post '/signup',  to: 'users#create'
  post '/login',	  to: 'sessions#create'
  post '/addlistings', to: 'houses#create'
  resources :users
  resources :houses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
