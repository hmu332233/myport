class BlocksController < ApplicationController
  
  # POST /blocks
  # parameter : user_id, block_user_id
  def create
    
    _user_id = params[:user_id]
    _block_user_id = params[:block_user_id]
    
    Block.create(user_id: _user_id, block_user_id: _block_user_id)
    
  end


  # DELETE /blocks
  # parameter : user_id, block_user_id
  def delete
    
    _user_id = params[:user_id]
    _block_user_id = params[:block_user_id]
    
    Block.where(user_id: _user_id, block_user_id: _block_user_id).first.delete
    
  end
end
