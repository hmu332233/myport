class BookmarksController < ApplicationController
  
  # POST /bookmarks
  # parameter : post_id
  def create
    
    bookmark = Bookmark.new
    bookmark.user_id = current_user.id
    bookmark.post_id = params[:post_id]
    bookmark.save
    
  end

  # DELETE /bookmarks
  # parameter : post_id
  def delete
    
    bookmark = Bookmark.find_by_post_id(params[:post_id])
    bookmark.delete
    
  end
end
