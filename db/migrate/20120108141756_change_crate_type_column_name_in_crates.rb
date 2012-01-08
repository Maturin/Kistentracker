class ChangeCrateTypeColumnNameInCrates < ActiveRecord::Migration
  def up
    rename_column :crates, :crate_priority, :crate_priority_value
  end

  def down
    rename_column :crates, :crate_priority_value, :crate_priority
  end
end
