class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :name
      t.string :url
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
