class AddPriorityAndTypeColumnsToCrates < ActiveRecord::Migration
  def self.up
    add_column :crates, :crate_type, :string, :default => 'Kiste'
    add_column :crates, :crate_priority, :integer, :default => 5
  end
  
  def self.down
    remove_column :crates, :crate_priority
    remove_column :crates, :crate_type
  end
end
