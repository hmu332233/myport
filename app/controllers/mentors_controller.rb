class MentorsController < ApplicationController
  
  before_action :authenticate_user!

  
  def index
  end

  def new
  end
  
  def create
  end

  def delete
  end
  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
  
  def management
    
    @mentor = current_user.mentor
    @mentees = current_user.mentees
    
  end
end
