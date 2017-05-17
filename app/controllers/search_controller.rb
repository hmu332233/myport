class SearchController < ApplicationController
  
  def index
    
    word = params[:word]

    @users = User.find_by_tag_name(word)
    @posts = Post.find_by_tag_name_at_all_posts(word)
    
  end

  # GET /search/posts/:word
  # parameter : word
  # return : json: users
  def search_users
    
    word = params[:word]

    users = User.find_by_tag_name(word)
    
    render json: users.to_json
  end
  
  # GET /search/posts/:word
  # parameter : word
  # return : json: posts
  def search_posts
    
    word = params[:word]
    
    posts = Post.find_by_tag_name_at_all_posts(word)
    
    render json: posts.to_json
  end
end

