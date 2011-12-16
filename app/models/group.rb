class Group < ActiveRecord::Base
    #has_and_belongs_to_many :users
    belongs_to :domain
    belongs_to :dataset
    has_many :user_groups
    has_many :users, :through => :user_groups
end
