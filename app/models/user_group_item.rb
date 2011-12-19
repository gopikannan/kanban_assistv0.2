class UserGroupItem < ActiveRecord::Base
       belongs_to :user_group
       has_many :plays
end
