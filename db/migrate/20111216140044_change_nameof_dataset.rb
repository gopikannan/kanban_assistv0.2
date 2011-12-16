class ChangeNameofDataset < ActiveRecord::Migration
  def self.up
      change_column :datasets, :name, :string
  end

  def self.down
      
  end
end
