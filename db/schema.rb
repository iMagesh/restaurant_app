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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180729121335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "restaurant_table_id"
    t.datetime "reservation_from"
    t.datetime "reservation_to"
    t.integer  "guest_id"
    t.integer  "guests_count"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "reservations", ["guest_id"], name: "index_reservations_on_guest_id", using: :btree
  add_index "reservations", ["restaurant_table_id"], name: "index_reservations_on_restaurant_table_id", using: :btree

  create_table "restaurant_shifts", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "restaurant_shifts", ["restaurant_id"], name: "index_restaurant_shifts_on_restaurant_id", using: :btree

  create_table "restaurant_tables", force: :cascade do |t|
    t.string   "name"
    t.integer  "min_guests"
    t.integer  "max_guests"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "restaurant_tables", ["restaurant_id"], name: "index_restaurant_tables_on_restaurant_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "guests"
  add_foreign_key "reservations", "restaurant_tables"
  add_foreign_key "restaurant_shifts", "restaurants"
  add_foreign_key "restaurant_tables", "restaurants"
end
