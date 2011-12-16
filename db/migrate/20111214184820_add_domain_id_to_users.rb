class AddDomainIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :domain_id, :integer
  end

  def self.down
    remove_column :users, :domain_id
  end
end
