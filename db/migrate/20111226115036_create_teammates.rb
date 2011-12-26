class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.text :address
      t.string :zip
      t.string :city
      t.string :phone
      t.string :cell
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
