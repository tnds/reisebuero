# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120621150105) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "event_categories", :force => true do |t|
    t.integer  "event_id"
    t.integer  "category_id"
    t.integer  "number_required"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "event_categories", ["category_id"], :name => "index_event_categories_on_category_id"
  add_index "event_categories", ["event_id"], :name => "index_event_categories_on_event_id"

  create_table "event_helpers", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "event_helpers", ["category_id"], :name => "index_event_helpers_on_category_id"
  add_index "event_helpers", ["event_id"], :name => "index_event_helpers_on_event_id"
  add_index "event_helpers", ["user_id"], :name => "index_event_helpers_on_user_id"

  create_table "event_orgas", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "event_orgas", ["category_id"], :name => "index_event_orgas_on_category_id"
  add_index "event_orgas", ["event_id"], :name => "index_event_orgas_on_event_id"
  add_index "event_orgas", ["user_id"], :name => "index_event_orgas_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "location"
    t.text     "description"
    t.boolean  "all_day"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
