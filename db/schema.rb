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

ActiveRecord::Schema.define(version: 20150416213208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chore_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chore_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chore_logs", ["chore_id"], name: "index_chore_logs_on_chore_id", using: :btree
  add_index "chore_logs", ["user_id"], name: "index_chore_logs_on_user_id", using: :btree

  create_table "chores", force: :cascade do |t|
    t.string   "task"
    t.integer  "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chores", ["house_id"], name: "index_chores_on_house_id", using: :btree

  create_table "communal_items", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.integer  "quantity"
    t.integer  "house_id"
    t.string   "stock_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "communal_items", ["house_id"], name: "index_communal_items_on_house_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "description"
    t.integer  "housing_assignment_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "events", ["housing_assignment_id"], name: "index_events_on_housing_assignment_id", using: :btree

  create_table "houses", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "property_manager_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "houses", ["address_id"], name: "index_houses_on_address_id", using: :btree
  add_index "houses", ["property_manager_id"], name: "index_houses_on_property_manager_id", using: :btree

  create_table "housing_assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "house_id"
    t.string   "lease_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "housing_assignments", ["house_id"], name: "index_housing_assignments_on_house_id", using: :btree
  add_index "housing_assignments", ["user_id"], name: "index_housing_assignments_on_user_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "reason"
    t.integer  "issuable_id"
    t.string   "issuable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "issues", ["issuable_type", "issuable_id"], name: "index_issues_on_issuable_type_and_issuable_id", using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.string   "picture_url"
    t.integer  "housing_assignment_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "messages", ["housing_assignment_id"], name: "index_messages_on_housing_assignment_id", using: :btree

  create_table "property_managers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "property_managers", ["address_id"], name: "index_property_managers_on_address_id", using: :btree

  create_table "rules", force: :cascade do |t|
    t.string   "content"
    t.integer  "housing_assignment_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rules", ["housing_assignment_id"], name: "index_rules_on_housing_assignment_id", using: :btree

  create_table "user_promises", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "fulfilled",       default: false
    t.integer  "promisable_id"
    t.string   "promisable_type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "user_promises", ["promisable_type", "promisable_id"], name: "index_user_promises_on_promisable_type_and_promisable_id", using: :btree
  add_index "user_promises", ["user_id"], name: "index_user_promises_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "photo_url"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "chore_logs", "chores"
  add_foreign_key "chore_logs", "users"
  add_foreign_key "chores", "houses"
  add_foreign_key "communal_items", "houses"
  add_foreign_key "events", "housing_assignments"
  add_foreign_key "houses", "addresses"
  add_foreign_key "houses", "property_managers"
  add_foreign_key "housing_assignments", "houses"
  add_foreign_key "housing_assignments", "users"
  add_foreign_key "issues", "users"
  add_foreign_key "messages", "housing_assignments"
  add_foreign_key "property_managers", "addresses"
  add_foreign_key "rules", "housing_assignments"
  add_foreign_key "user_promises", "users"
end