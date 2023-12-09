Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'home#index'
  devise_for :users
  resources :cars

  # Categories Routes
  get '/categories', to: 'cars#categories'
  get '/category', to: 'cars#category'

  # User Profile
  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'
  get '/user/settings', to: 'users#settings'

  get '/about', to: 'home#about_us'
  get '/contact-us', to: 'home#contact_us'
  post '/message', to: 'home#message'

  # Password Update
  get '/user/settings/update-password', to: 'users#update_password'
  patch '/user/settings/password', to: 'users#password'

  # Dashboard
  get '/dashboard', to: 'users#dashboard'

  # Paystack
  post '/initialize', to: 'orders#initialize_transaction'
  post '/webhook', to: 'orders#webhook'
  get '/callback/:reference', to: 'orders#callback'
  resources :manufacturers
  resources :favourites, only: %i[index create destroy]
  resources :orders, only: %i[index show]
end
