class CreateDemands < ActiveRecord::Migration
  def self.up
    create_table :demands do |t|
      t.integer :item_id
      t.integer :demandcount
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end

  def self.down
    drop_table :demands
  end
end
