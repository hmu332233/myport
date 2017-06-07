Rails.application.routes.draw do
  
  get 'mentors/index'

  get 'mentors/new' 
  
  get 'mentors/create' => 'mentors#create'


  get 'mentors/:id' => 'mentors#show'
  get 'mentors/:id/commentcreate' => 'mentors#commentcreate'
  


  get 'mentors/:id/edit' => 'mentors#edit'

  get 'mentors/:id/update' => 'mentors#update'

  get 'mentors/:id/delete' => 'mentors#delete'
  
  # get 'mentors/:id/commentcreate' => 'mentors#commentcreate'
  
 

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
