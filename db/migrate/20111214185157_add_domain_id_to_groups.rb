class AddDomainIdToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :domain_id, :integer
  end

  def self.down
    remove_column :groups, :domain_id
  end
end
