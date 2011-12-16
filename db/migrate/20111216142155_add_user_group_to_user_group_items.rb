class AddUserGroupToUserGroupItems < ActiveRecord::Migration
  def self.up
    add_column :user_group_items, :user_group_id, :integer
  end

  def self.down
    remove_column :user_group_items, :user_group_id
  end
end
