class Dataset < ActiveRecord::Base
    has_many :groups
    has_many :items
end
