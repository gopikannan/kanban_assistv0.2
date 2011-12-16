class CreatePlays < ActiveRecord::Migration
  def self.up
    create_table :plays do |t|
      t.integer :item_id
      t.integer :parlevel
      t.integer :maxReorderPoint
      t.integer :minReorderPoint
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end

  def self.down
    drop_table :plays
  end
end
