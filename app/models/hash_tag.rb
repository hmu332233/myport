class HashTag < ActiveRecord::Base
    has_many :post2tags
    has_many :posts, :through => :post2tags
end
