class ChangeItemidColumnPlay < ActiveRecord::Migration
  def self.up
      change_column :plays, :item_id, :user_group_item_id
      add_column    :plays, :user_group_id, :integer
  end

  def self.down
  end
end
