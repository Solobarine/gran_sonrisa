Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  devise_for :users
  resources :cars
  get '/categories', to: 'cars#categories'
  get '/categories/:id', to: 'cars#category'
  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'
  get '/dashboard', to: 'users#dashboard'
  post '/initialize', to: 'orders#initialize_transaction'
  resources :manufacturers
  resources :favourites, only: %i[index create destroy]

  match '*unmatched', to: 'application#not_found_method', via: :all
end
