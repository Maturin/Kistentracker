# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120108121820) do

  create_table "crate_priorities", :force => true do |t|
    t.integer  "priority"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crate_types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cratepayers", :force => true do |t|
    t.integer  "teammate_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crates", :force => true do |t|
    t.integer  "cratepayer_id"
    t.string   "reason"
    t.date     "date"
    t.date     "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teammates", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "dob"
    t.text     "address"
    t.string   "zip"
    t.string   "city"
    t.string   "phone"
    t.string   "cell"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
