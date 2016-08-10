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

ActiveRecord::Schema.define(version: 20160729202345) do

  create_table "districts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "district_id", limit: 4
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "place_id",    limit: 4
  end

  add_index "favorites", ["district_id"], name: "index_favorites_on_district_id", using: :btree
  add_index "favorites", ["place_id"], name: "index_favorites_on_place_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "menu_roles", force: :cascade do |t|
    t.integer  "menu_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "menu_roles", ["menu_id"], name: "index_menu_roles_on_menu_id", using: :btree
  add_index "menu_roles", ["role_id"], name: "index_menu_roles_on_role_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "flag"
    t.string   "icon",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "address",             limit: 255
    t.float    "price",               limit: 24
    t.string   "url_image",           limit: 255
    t.boolean  "state"
    t.boolean  "state_list"
    t.date     "started_at"
    t.date     "ended_at"
    t.time     "started_time"
    t.time     "ended_time"
    t.string   "description",         limit: 255
    t.integer  "user_id",             limit: 4
    t.integer  "district_id",         limit: 4
    t.integer  "reservation_type_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "info",                limit: 65535
  end

  add_index "places", ["district_id"], name: "index_places_on_district_id", using: :btree
  add_index "places", ["reservation_type_id"], name: "index_places_on_reservation_type_id", using: :btree
  add_index "places", ["user_id"], name: "index_places_on_user_id", using: :btree

  create_table "reservation_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "code",                limit: 255
    t.date     "started_at"
    t.date     "ended_at"
    t.time     "started_time"
    t.time     "ended_time"
    t.integer  "user_id",             limit: 4
    t.integer  "place_id",            limit: 4
    t.integer  "reservation_type_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "state",               limit: 255
  end

  add_index "reservations", ["place_id"], name: "index_reservations_on_place_id", using: :btree
  add_index "reservations", ["reservation_type_id"], name: "index_reservations_on_reservation_type_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "flag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "phone",                  limit: 255
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "favorites", "districts"
  add_foreign_key "favorites", "places"
  add_foreign_key "favorites", "users"
  add_foreign_key "menu_roles", "menus"
  add_foreign_key "menu_roles", "roles"
  add_foreign_key "places", "districts"
  add_foreign_key "places", "reservation_types"
  add_foreign_key "places", "users"
  add_foreign_key "reservations", "places"
  add_foreign_key "reservations", "reservation_types"
  add_foreign_key "reservations", "users"
  add_foreign_key "users", "roles"
end
