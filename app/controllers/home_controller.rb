class HomeController < ApplicationController
  
  #
  before_action :authenticate_user!

  def index
   @posts = current_user.posts
   puts @posts
  end
  
  
  def create_post
    @post = Post.new
  end
  
  def update_post
    @post = Post.find(params[:id])
  end

  


end
