class BoardsController < ApplicationController

  before_action :authenticate_user!

  
  def index
    @boards = Board.all.reverse
  end

  def new
  end
  
  def create
    _title= params[:title]
    _content = params[:content]
    _writer = params[:writer]
    
    Board.create(title: _title, writer: _writer, content: _content,user_id: current_user.id)
    
    redirect_to '/boards/index'
  end

  def delete
  end
  
  def show
    id = params[:id]
    
  
    @post = Board.find(id)
    @comments = @post.comments.all.reverse
    @count = @comments.count


    @isMine = true if @post.user_id == current_user.id
  end

  def edit
     _id = params[:id]
    
    @post = Board.find(_id)
  end

  def update
     _id = params[:id]
     _title = params[:title]
     _writer = params[:writer]
     _content = params[:content]
     
     post = Board.find(_id)
     
     post.update(title: _title, writer: _writer, content: _content)
     redirect_to '/boards/index'
  end


  def delete
      id = params[:id]
      
      post = Board.find(id)
      post.delete
      
      redirect_to '/boards/index'
  end
  
  
  def commentcreate
    _id = params[:id]
    _name = params[:replyname]
    _content = params[:replycontent]
    
    Comment.create(replyname: _name, replycontent: _content,board_id: _id)
    
    redirect_to '/boards/' + _id

  end
  
  def management
    
    @mentor = current_user.mentor
    @mentees = current_user.mentees
    
  end
  
end
