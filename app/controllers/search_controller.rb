class SearchController < ApplicationController
  def index
  end

  def search_users
    
    User.find_each do |user|
    end
    
    
  end

  def search_posts
  end
end

