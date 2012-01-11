class AddNameToUserGroupItem < ActiveRecord::Migration
  def self.up
    add_column :user_group_items, :name, :string
  end

  def self.down
    remove_column :user_group_items, :name
  end
end
