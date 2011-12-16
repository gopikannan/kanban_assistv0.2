class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.integer :box_quantity
      t.decimal :orederingcost
      t.decimal :stockoutpenaltycost
      t.decimal :holdingcost

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
