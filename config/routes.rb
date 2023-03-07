Rails.application.routes.draw do
  resources :devices
  resources :floors
  resources :buildings
  resources :rooms
  resources :clients do
    resources :rooms
    resources :buildings
    resources :floors
    resources :devices
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'clients#index'
end
