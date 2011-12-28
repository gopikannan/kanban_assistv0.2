class Removecolumnplays < ActiveRecord::Migration
  def self.up
      add_column    :plays, :user_group_item_id, :integer
  end

  def self.down
  end
end
