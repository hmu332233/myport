Rails.application.routes.draw do
  
  get 'blocks/create'

  get 'blocks/delete'
  
  
  
  
  
  get 'home/board' => 'home#board'
  get 'home/new_board' => 'home#new_board'
 
  get 'home/create_board' => 'home#create_board' 

  get 'home/:id' => 'home#show_board'
  get '/home/:id/edit_board' => 'home#edit_board'
  get 'home/:id/update_board' => 'home#update_board'
  
  get 'home/:id/delete_board' => 'home#delete_board'
  
  
  
  
  root 'page#main'
  # root 'home#index'
  
  #search
  get '/search' => 'search#index'
  get '/search/users/:word' => 'search#search_users'
  get '/search/posts/:word' => 'search#search_posts'

  #bookmark
  post '/bookmarks' => 'bookmarks#create'
  delete '/bookmarks' => 'bookmarks#delete'

  #posts
  get '/user/:id/bookmark' => 'posts#bookmark'
  get '/user/:id' => 'posts#index'
  get '/posts/:id' => 'posts#show'
  get '/posts/:id/edit' => 'posts#edit'
  post '/posts' => 'posts#create'
  patch '/posts/:id' => 'posts#update'
  put '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#delete'
  
  #search
  get '/posts/search/:word' => 'posts#search'

  #test
  get 'home/create_post'
  get 'home/update_post/:id' => 'home#update_post'

  devise_for :users


end
