class PostsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    
    #post
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_name = current_user.name
    @post.save!
    
    #hash_tag
    tags = params[:hash_tag].split(', ')
    puts tags
    
    tags.each do |tag|
    
      hash_tag = HashTag.find_or_create_by(name: tag)
      hash_tag.name = tag
      hash_tag.save
      
      @post.hash_tags << hash_tag
      
      post2tag = @post.post2tags.last
      post2tag.user_id = current_user.id
      post2tag.save
      
    
    end
    
    #uploader
    post_file = params[:post][:file]
    uploader = FileUploader.new
    
    
    unless post_file.nil?
      
      uploader.store!(post_file)
  
      #file
      file = DownloadFile.new
      file.url = uploader.url
      file.post_id = @post.id
      file.name = post_file.original_filename
      file.saved_name = uploader.uploaded_filename
      file.save
      
    end
  
    #picture
    post_picture = params[:post][:picture]
    
    unless post_picture.nil?
      
      uploader.store!(post_picture)
      
      picture = Picture.new
      picture.url = uploader.url
      picture.post_id = @post.id
      picture.save
    
    end

   
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

    @post = Post.new
    
    @hash_tags = HashTag.find_favorite_tags(current_user.id,4)
    
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
    # puts @post.title
    
    @tag_data = ""
    
    @post.hash_tags.each do |tag|
      @tag_data += "#{tag.name},"
    end
    @tag_data.chop!
    
  end
  
  def search
  
    word = params[:word]
    
    posts = Post.find_by_tag_name_at_user_posts(current_user.id,word)
    
    render json: posts.to_json
  end
  
  def post_params
    return params.require(:post).permit(:title,:content,:scope)
  end
end
