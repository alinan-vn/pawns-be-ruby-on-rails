Rails.application.routes.draw do
  resources :users
  resources :a_votes
  resources :articles
  resources :comments
  resources :replies
  
end
