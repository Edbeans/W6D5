Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  #Users Routes
  resources :users, only: [:create, :destroy, :index, :show, :update] 
  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new' etc. 
  
  #Artworks Routes 
  resources :artworks, only: [:create, :destroy, :index, :show, :update] 
  # get 'artworks/index'
  # get 'artworks/create'
  # get 'artworks/destroy'
  # get 'artworks/show'
  # get 'artworks/update'

  #ArtworkShares Routes 
  resources :artwork_shares, only: [:create, :destroy] 

  #User's Artworks Route
  resources :users do
    resources :artworks, only: [:index] 
  end

end
