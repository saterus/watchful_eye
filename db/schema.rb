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

ActiveRecord::Schema.define(version: 20150303200226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credentials", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "password_digest", default: "", null: false
    t.datetime "confirmed_at"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "credentials", ["email"], name: "index_credentials_on_email", unique: true, using: :btree
  add_index "credentials", ["employee_id"], name: "index_credentials_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_entries", force: :cascade do |t|
    t.text     "notes"
    t.datetime "date",                            null: false
    t.integer  "duration_in_minutes", default: 0, null: false
    t.integer  "task_id",                         null: false
    t.integer  "project_id",                      null: false
    t.integer  "employee_id",                     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "timers", force: :cascade do |t|
    t.datetime "start_time",    default: '2015-03-03 20:03:24', null: false
    t.datetime "end_time"
    t.integer  "time_entry_id",                                 null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

end
