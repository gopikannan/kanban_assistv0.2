class AddDemandFilePathsToDatasets < ActiveRecord::Migration
  def self.up
    add_column :datasets, :demand_file_paths, :string
  end

  def self.down
    remove_column :datasets, :demand_file_paths
  end
end
