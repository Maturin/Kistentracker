class CreateCraterpayers < ActiveRecord::Migration
  def change
    create_table :craterpayers do |t|
      t.integer :teammate_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
