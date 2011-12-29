class RenameTableCraters < ActiveRecord::Migration
  def up
    rename_table :craters, :crates
    rename_table :craterpayers, :cratepayers

    rename_column :crates, :craterpayer_id, :cratepayer_id
  end

  def down
    #rename_column :crates, :cratepayer_id, :craterpayer_id

    #rename_table :cratepayers, :craterpayers
    rename_table :crates, :craters
  end
end
