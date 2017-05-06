class HashTag < ActiveRecord::Base
    has_many :post2tags
    has_many :posts, :through => :post2tags
    
    
    
    def self.find_favorite_tags(_user_id,_size)
        
        post2tags = Post2tag.where(user_id: _user_id)

        result_hash = post2tags.group(:hash_tag_id).order('count_id desc').limit(_size).count('id')
        
        tags = []
        result_hash.each do |k,v|
          tags << HashTag.find(k)
        end
        
        return tags
    end
end
