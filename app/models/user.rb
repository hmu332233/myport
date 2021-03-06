class User < ActiveRecord::Base
  has_many :posts
  has_many :bookmarks
  has_many :blocks
  has_many :boards
  
  
  belongs_to :mentor, :class_name => "User", :foreign_key => "mentor_user_id"
  has_many :mentees, :class_name => "User", :foreign_key => "mentor_user_id"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  def self.find_by_tag_name(word)
    
    users = []
    User.find_each do |user|
      
      HashTag.find_favorite_tags(user.id,5).each do |tag|
        
        if word === tag.name
          users << user
          break
        end
        
      end

    end
    
    return users
  end
  
  def favorite_tags
    return HashTag.find_favorite_tags(id,5)
  end
         
end
