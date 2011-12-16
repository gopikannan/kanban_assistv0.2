class CreateUsersGroups < ActiveRecord::Migration
  def self.up
      create_table "users_groups", do |t|
          t.column "user_id",:integer
          t.column "group_id", :integer
      end
  end

  def self.down
      drop table "users_groups"
  end
end
