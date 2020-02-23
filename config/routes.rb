Rails.application.routes.draw do
  resources :users
  resources :a_votes
  resources :articles
  resources :comments
  resources :replies

  # resources :auth, only: :create
  post '/auth', to: 'auth#create'
  
end
