class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    
    #post
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.name
    @post.save!
    
    #uploader
    post_file = params[:post][:file]
    
    uploader = FileUploader.new
    uploader.store!(post_file)

    #file
    file = DownloadFile.new
    file.url = uploader.url
    file.post_id = @post.id
    file.name = post_file.original_filename
    file.save
    
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
