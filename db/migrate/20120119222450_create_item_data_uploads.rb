class CreateItemDataUploads < ActiveRecord::Migration
  def self.up
    create_table :item_data_uploads do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :item_data_uploads
  end
end
