# config/routes.rb

Rails.application.routes.draw do
  # Root route
  root to: 'pages#home'

  # Pages
  get 'about', to: 'pages#about'

  # Profile
  get 'profile', to: 'users#profile'

  # Settings
  get 'settings', to: 'users#settings', as: :settings
  patch 'update_settings', to: 'users#update_settings', as: :update_settings  # Changed from post to patch

  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  # Articles
  resources :articles

  # User Signup
  resources :users, only: [:new, :create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
