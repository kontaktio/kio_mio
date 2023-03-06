Rails.application.routes.draw do
  resources :floors
  resources :buildings
  resources :rooms
  resources :clients do
    resources :rooms
    resources :buildings
    resources :floors
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'clients#index'
end
