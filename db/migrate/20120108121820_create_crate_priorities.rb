class CreateCratePriorities < ActiveRecord::Migration
  def change
    create_table :crate_priorities do |t|
      t.integer :priority
      t.string :description

      t.timestamps
    end
  end
end
