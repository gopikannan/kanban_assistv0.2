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

ActiveRecord::Schema.define(:version => 20111216171736) do

  create_table "datasets", :force => true do |t|
    t.string   "name"
    t.date     "creation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demands", :force => true do |t|
    t.integer  "item_id"
    t.integer  "demandcount"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "domain_id"
    t.integer  "dataset_id"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "box_quantity"
    t.decimal  "orederingcost"
    t.decimal  "stockoutpenaltycost"
    t.decimal  "holdingcost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dataset_id"
    t.string   "identifier"
  end

  create_table "plays", :force => true do |t|
    t.integer  "item_id"
    t.integer  "parlevel"
    t.integer  "maxReorderPoint"
    t.integer  "minReorderPoint"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "user_group_demands", :force => true do |t|
    t.integer  "user_group_item_id"
    t.date     "startdate"
    t.date     "enddate"
    t.integer  "demandcount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_group_items", :force => true do |t|
    t.integer  "users_groups_id"
    t.string   "identifier"
    t.decimal  "orderingcost"
    t.decimal  "holdingcost"
    t.decimal  "stockoutpenaltycost"
    t.integer  "boxquantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_group_id"
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "domain_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_groups", :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

end
