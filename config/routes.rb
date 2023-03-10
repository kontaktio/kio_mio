Rails.application.routes.draw do
  resources :telemetries
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
  get '/login' => 'clients#login'

  resources :presences
  resources :positions
  resources :devices do
    member do
      get 'update_presence', to: 'devices#update_presence'
      get 'update_positions', to: 'devices#update_positions'
      get "add_devices", to: "devices#add_devices"
      get "debug", to: "devices#debug"
      get "delete_presence", to: "devices#delete_presence"
    end
  end
resources :floors
  resources :buildings
  resources :rooms do
    member do
      get 'update_presence', to: 'rooms#update_presence'
      get "delete_presence", to: "rooms#delete_presence"
    end
  end
  resources :clients do
    member do
      get '/clients/reset', to: 'clients#reset'
      get '/clients/get_all', to: 'clients#get_all'
    end
    resources :rooms
    resources :buildings
    resources :floors
    resources :devices
    resources :positions
    resources :presences
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'clients#index'
end
