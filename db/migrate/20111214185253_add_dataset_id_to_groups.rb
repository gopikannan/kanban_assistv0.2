class AddDatasetIdToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :dataset_id, :integer
  end

  def self.down
    remove_column :groups, :dataset_id
  end
end
