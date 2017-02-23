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

ActiveRecord::Schema.define(version: 20170222215538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "tech"
    t.string   "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reset_passwords", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reset_passwords_on_user_id", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "sponsor_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "team_captains", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_captains_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_captains_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "event_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["event_id"], name: "index_teams_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "experience"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "team_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "language"
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  create_table "wait_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wait_lists_on_user_id", using: :btree
  end

  add_foreign_key "admins", "users"
  add_foreign_key "reset_passwords", "users"
  add_foreign_key "team_captains", "teams"
  add_foreign_key "team_captains", "users"
  add_foreign_key "teams", "events"
  add_foreign_key "users", "teams"
  add_foreign_key "wait_lists", "users"
end
