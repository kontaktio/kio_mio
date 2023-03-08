Rails.application.routes.draw do
  resources :presences
  resources :positions
  resources :devices
  resources :floors
  resources :buildings
  resources :rooms
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
