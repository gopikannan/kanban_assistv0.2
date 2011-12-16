class AddDatasetIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :dataset_id, :integer
  end

  def self.down
    remove_column :items, :dataset_id
  end
end
