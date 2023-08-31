Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  # Pages
  root 'pages#home'
  get 'about', to: 'pages#about'

  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Articles
  resources :articles

  # User Signup
  resources :users, only: [:new, :create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
