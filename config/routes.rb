Rails.application.routes.draw do
  # Root route (redirect to sign-in page)
  root 'sessions#new'

  # Pages
  get 'about', to: 'pages#about'

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
