class CreateUserGroupDemands < ActiveRecord::Migration
  def self.up
    create_table :user_group_demands do |t|
      t.integer :user_group_item_id
      t.date :startdate
      t.date :enddate
      t.integer :demandcount

      t.timestamps
    end
  end

  def self.down
    drop_table :user_group_demands
  end
end
