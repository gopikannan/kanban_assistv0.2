class CreateUserGroupItems < ActiveRecord::Migration
  def self.up
    create_table :user_group_items do |t|
      t.integer :users_groups_id
      t.string :identifier
      t.decimal :orderingcost
      t.decimal :holdingcost
      t.decimal :stockoutpenaltycost
      t.integer :boxquantity

      t.timestamps
    end
  end

  def self.down
    drop_table :user_group_items
  end
end
