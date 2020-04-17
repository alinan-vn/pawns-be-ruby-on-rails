Rails.application.routes.draw do
  resources :users
  # resources :a_votes
  resources :articles
  resources :comments
  resources :replies
  resources :blogs

  # resources :auth, only: :create
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'

  post '/post_article', to: 'articles#post_article'

  get '/get_votes_and_comments/:article_id', to: 'articles#get_votes_and_comments'
  get 'get_comments/:user_id', to: 'comments#get_comments'
end
