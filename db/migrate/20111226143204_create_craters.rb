class CreateCraters < ActiveRecord::Migration
  def change
    create_table :craters do |t|
      t.integer :craterpayer_id
      t.string :reason
      t.date :date
      t.date :paid

      t.timestamps
    end
  end
end
