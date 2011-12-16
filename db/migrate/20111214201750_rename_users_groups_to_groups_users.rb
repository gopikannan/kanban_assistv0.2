class RenameUsersGroupsToGroupsUsers < ActiveRecord::Migration
  def self.up
      rename_table :users_groups, :groups_users
  end

  def self.down
  end
end
