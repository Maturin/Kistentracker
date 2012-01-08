class CreateCrateTypes < ActiveRecord::Migration
  def change
    create_table :crate_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
