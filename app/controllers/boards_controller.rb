class BoardsController < ApplicationController
  
  # POST /mentors/:mentor_id
  def create_mentor
    
    mentor_id = params[:mentor_id]
    
    current_user.mentor = User.find(mentor_id)
    
    
  end

  #DELETE /mentors/:mentor_id
  def delete_mentor
  
    mentor_id = params[:mentor_id]
    
    current_user.mentor = nil
  
  end

  #POST /mentees/:mentee_id
  def create_mentee
    
    mentee_id = params[:mentee_id]
    
    current_user.mentees << User.find(mentee_id)
    
  end

  #DELETE /mentees/:mentee_id
  def delete_mentee
    
    mentee_id = params[:mentee_id]
    
    User.find(mentee_id).mentor = nil
    
  end

  def management
  end
end
