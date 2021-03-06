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

ActiveRecord::Schema.define(version: 20160530074344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "url_clicks", force: :cascade do |t|
    t.integer  "url_id",      null: false
    t.inet     "ip"
    t.datetime "occurred_at", null: false
  end

  add_index "url_clicks", ["url_id"], name: "index_url_clicks_on_url_id", using: :btree

  create_table "urls", force: :cascade do |t|
    t.string   "long_url"
    t.string   "short_url"
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_campaign"
    t.string   "utm_term"
    t.string   "utm_content"
  end

  add_index "urls", ["short_url"], name: "index_urls_on_short_url", using: :btree
  add_index "urls", ["user_id"], name: "index_urls_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "url_clicks", "urls"
  add_foreign_key "urls", "users"
end
