Rails.application.routes.draw do
  resources :rooms
  resources :clients do
    resources :rooms
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'clients#index'
end
