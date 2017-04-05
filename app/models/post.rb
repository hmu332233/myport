class Post < ActiveRecord::Base
    has_many :pictures
    has_many :download_files
end
