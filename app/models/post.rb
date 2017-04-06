class Post < ActiveRecord::Base
    belongs_to :user
    has_many :pictures
    has_many :download_files
    has_many :hash_tags
end
