class Dataset < ActiveRecord::Base
    has_many :groups
    has_many :items
    has_attached_file :item_file_path
end
