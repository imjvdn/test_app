Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get '/about', to: 'pages#about'


  # get 'about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # This is the route for the articles controller
  resources :articles

end
