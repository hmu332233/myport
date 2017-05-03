class Post < ActiveRecord::Base
    belongs_to :user
    has_many :pictures
    has_many :download_files
    has_one :bookmark
    
    has_many :post2tags
    has_many :hash_tags, :through => :post2tags
end
