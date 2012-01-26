class AddItemsFilePathToDatasets < ActiveRecord::Migration
  def self.up
    add_column :datasets, :item_file_path, :string
  end

  def self.down
    remove_column :datasets, :item_file_path
  end
end
