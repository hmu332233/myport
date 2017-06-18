class Post < ActiveRecord::Base
    belongs_to :user
    has_many :pictures
    has_many :download_files
    has_one :bookmark
    has_many :post_comments
    
    has_many :post2tags
    has_many :hash_tags, :through => :post2tags
    
    # 모든 게시글 중 해시태그를 포함한 post를 찾는다.
    # parameter : tag_name
    # return : posts - list
    def self.find_by_tag_name_at_all_posts(tag_name)
        
        posts = []
        
        Post.all.each do |post|
          unless post.hash_tags.find_by_name(tag_name).nil?
            posts << post
          end
        end
        
        return posts
    end
    
    # 특정 유저의 posts 중 해시태그를 포함한 post를 찾는다.
    # parameter : tag_name
    # return : posts - list
    def self.find_by_tag_name_at_user_posts(_user_id, tag_name)

        user = User.find(_user_id) 
        posts = []
        
        user.posts.each do |post|
          unless post.hash_tags.find_by_name(tag_name).nil?
            posts << post
          end
        end
        
        return posts
    end
    
end
