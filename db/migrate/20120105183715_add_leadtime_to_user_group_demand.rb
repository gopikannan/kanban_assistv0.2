class AddLeadtimeToUserGroupDemand < ActiveRecord::Migration
  def self.up
    add_column :user_group_demands, :leadtime, :integer
  end

  def self.down
    remove_column :user_group_demands, :leadtime
  end
end
