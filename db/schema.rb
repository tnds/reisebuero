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

ActiveRecord::Schema.define(:version => 20121213174746) do

  create_table "bookings", :force => true do |t|
    t.integer  "lodging_id"
    t.integer  "people"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "comment"
  end

  add_index "bookings", ["lodging_id"], :name => "index_bookings_on_lodging_id"
  add_index "bookings", ["user_id"], :name => "index_bookings_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contacttype_id"
    t.text     "address",        :limit => 255
    t.boolean  "public"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "contacts", ["contacttype_id"], :name => "index_contacts_on_contacttype_id"
  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "contacttypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "text"
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
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "orga",        :default => false
  end

  add_index "event_helpers", ["category_id"], :name => "index_event_helpers_on_category_id"
  add_index "event_helpers", ["event_id"], :name => "index_event_helpers_on_event_id"
  add_index "event_helpers", ["user_id"], :name => "index_event_helpers_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "location"
    t.text     "description"
    t.boolean  "all_day"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "uid"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "helper_candidates", :force => true do |t|
    t.integer  "user_id"
    t.date     "start_at"
    t.date     "end_at"
    t.string   "comment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "anonymous"
    t.text     "mod_comment"
    t.text     "location"
  end

  add_index "helper_candidates", ["user_id"], :name => "index_helper_candidates_on_user_id"

  create_table "lodgings", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "max_people"
    t.boolean  "accessible"
    t.text     "description"
    t.text     "location"
    t.text     "maplink"
    t.boolean  "request"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "anonymous"
    t.text     "mod_comment"
  end

  add_index "lodgings", ["event_id"], :name => "index_lodgings_on_event_id"
  add_index "lodgings", ["user_id"], :name => "index_lodgings_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "role_id"
    t.boolean  "disabled"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
