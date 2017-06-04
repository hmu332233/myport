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
  
  
  
  
  
  def board
     @boards = Board.all.reverse
  end
  
  
  def new_board
  end
  
  
  def edit_board 
     _id = params[:id]
    
    @post = Board.find(_id)
  end
  
  
  def update_board
     _id = params[:id]
    _title = params[:title]
    _writer = params[:writer]
    _content = params[:content]
    
    post = Board.find(_id)
    # post.title = _title
    # post.writer = _writer
    # post.content = _content
    # post.save
    
    post.update(title: _title, writer: _writer, content: _content)
    redirect_to "/home/board"
  end
  
  
  def create_board
    _title = params[:title]
    _writer = params[:writer]
    _content = params[:content]
    
    Board.create(title: _title, writer: _writer, content: _content)
    
    redirect_to "/home/board"
  end
  
  
  def show_board
    id = params[:id]
    
    @post = Board.find(id)


  end
  
  def delete_board
    _id = params[:id]
    
    post = Board.find(_id)
    
    post.delete
     redirect_to "/home/board"
  end
end
