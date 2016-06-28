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

ActiveRecord::Schema.define(version: 20160628161530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "star",                   default: true
    t.boolean  "admin",                  default: false
    t.boolean  "company_user",           default: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "gender"
    t.string   "age",                                                 array: true
    t.string   "birth_month"
    t.string   "relationship_status"
    t.string   "race"
    t.string   "anual_income"
    t.string   "children"
    t.integer  "kid_ages",                                            array: true
    t.boolean  "twins",                  default: false
    t.integer  "twin_ages",                                           array: true
    t.string   "education"
    t.string   "career"
    t.string   "employer"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "zip"
    t.string   "closest_city"
    t.string   "referral"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
