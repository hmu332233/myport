class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    
    puts params[:hash_tag]
    
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
    file.saved_name = uploader.uploaded_filename
    file.save
   
   
    #picture
    post_picture = params[:post][:picture]
    
    uploader.store!(post_picture)
    
    picture = Picture.new
    picture.url = uploader.url
    picture.post_id = @post.id
    picture.save
   
  end

  def update
    
    #post
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    #uploader
    post_file = params[:post][:file]
    
    uploader = FileUploader.new
    uploader.store!(post_file)
    
    #file
    file = @post.download_files.first
    
    path_to_file = Rails.public_path.to_s + "/uploads/#{file.saved_name}"
    File.delete(path_to_file) if File.exist?(path_to_file)
    
    file.url = uploader.url
    file.saved_name = uploader.uploaded_filename
    file.name = post_file.original_filename
    file.save
    
  end

  def delete
    Post.delete(params[:id])
  end
  
  def index
    
    @posts = current_user.posts
    puts @posts.last.id
    @post = Post.new
    
  end
  
  
  def show
    
    @post = Post.find(params[:id])
    puts @post.title
    
    case @post.scope
    when 0
      @scope = "개인 공개"
    when 1
      @scope = "전체 공개"
    when 2
      @scope = "멘토멘티 공개"
    end
    
  end
  
  def edit
    
    @post = Post.find(params[:id])
    puts @post.title
    
  end
  
  def post_params
    return params.require(:post).permit(:title,:content,:scope)
  end
end
