Rails.application.routes.draw do
  
  #mentor, mentee
  post 'mentors/:mentor_id' => 'mentors#create_mentor'
  delete 'mentors/:mentor_id' => 'mentors#delete_mentor'
  post 'mentees/:mentee_id' => 'mentors#create_mentee'
  delete 'mentees/:mentee_id' => 'mentors#delete_mentee'
  
  get 'boards/management'
  get 'boards/index'
  get 'boards/new' 
  get 'boards/create' => 'boards#create'
  get 'boards/:id' => 'boards#show'
  get 'boards/:id/commentcreate' => 'boards#commentcreate'
  get 'boards/:id/edit' => 'boards#edit'
  get 'boards/:id/update' => 'boards#update'
  get 'boards/:id/delete' => 'boards#delete'


  post '/blocks' => 'blocks#create'
  delete '/blocks' => 'blocks#delete' 

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
