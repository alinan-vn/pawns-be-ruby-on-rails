Rails.application.routes.draw do
  resources :users
  # resources :a_votes
  resources :articles
  resources :comments
  resources :replies
  resources :blogs


  post '/find_user_by_name', to: 'users#find_user_by_name'

  # resources :auth, only: :create
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'

  post '/post_article', to: 'articles#post_article'
  post '/post_blog', to: 'blogs#post_blog'

  get '/get_votes_and_comments/:article_id', to: 'articles#get_votes_and_comments'
  get 'get_comments/:user_id', to: 'comments#get_comments'
end
