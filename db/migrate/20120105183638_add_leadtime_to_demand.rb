class AddLeadtimeToDemand < ActiveRecord::Migration
  def self.up
    add_column :demands, :leadtime, :integer
  end

  def self.down
    remove_column :demands, :leadtime
  end
end
