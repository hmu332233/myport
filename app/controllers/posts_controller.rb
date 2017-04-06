class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.name
    @post.save
  
    puts params[:scope]
  end

  def update
    
    @post = Post.find(params[:id])
    @post.update(post_params)
    
  end

  def delete
    Post.delete(params[:id])
  end
  
  def post_params
    return params.require(:post).permit(:title,:content,:scope)
  end
end
