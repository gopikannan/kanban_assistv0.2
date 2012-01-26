class CreateDemandDataUploads < ActiveRecord::Migration
  def self.up
    create_table :demand_data_uploads do |t|
      t.string :demand_file_name
      t.string :demand_content_type
      t.integer :demand_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :demand_data_uploads
  end
end
