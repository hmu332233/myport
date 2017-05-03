class Post2tag < ActiveRecord::Base
    belongs_to :post
    belongs_to :hash_tag
end
