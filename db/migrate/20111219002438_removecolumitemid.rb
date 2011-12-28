class Removecolumitemid < ActiveRecord::Migration
  def self.up
      remove_column :plays, :item_id
  end

  def self.down
  end
end
