Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'home#index'
  devise_for :users
  resources :cars
  get '/categories', to: 'cars#categories'
  get '/category', to: 'cars#category'
  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'
  get '/dashboard', to: 'users#dashboard'
  post '/initialize', to: 'orders#initialize_transaction'
  post '/webhook', to: 'orders#webhook'
  get '/callback/reference', to: 'orders#callback'
  resources :manufacturers
  resources :favourites, only: %i[index create destroy]
  resources :orders, only: %i[index show]
end
