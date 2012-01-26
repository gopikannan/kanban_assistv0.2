class AddColsToItemDataUpload < ActiveRecord::Migration
  def self.up
      add_column :item_data_uploads, :item_file_name, :string
      add_column :item_data_uploads, :item_content_type, :string
      add_column :item_data_uploads, :item_file_size, :integer

    end

    def self.down
      remove_column :item_data_uploads, :item_file_name, :string
      remove_column :item_data_uploads, :item_content_type, :string
      remove_column :item_data_uploads, :item_file_size, :integer
    end

end
