class Play < ActiveRecord::Base
    belongs_to :user_group
    belongs_to :user_group_item
end
