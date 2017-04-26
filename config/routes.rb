Rails.application.routes.draw do
  
  #page
  get '/my' => 'page#my'
  
  #bookmark
  post '/bookmarks' => 'bookmarks#create'
  delete '/bookmarks' => 'bookmarks#delete'

  #post
  get '/posts' => 'home#index'
  post '/posts' => 'posts#create'
  patch '/posts/:id' => 'posts#update'
  put '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#delete'
  # resources 'posts'

  root 'home#index'
  get 'home/create_post'
  get 'home/update_post/:id' => 'home#update_post'

  devise_for :users


end
