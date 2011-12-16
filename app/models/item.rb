class Item < ActiveRecord::Base
    has_many :demands
    belongs_to :dataset
end
