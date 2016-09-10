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

ActiveRecord::Schema.define(version: 20160910153625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "exercise_categories_exercises", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "exercise_category_id"
  end

  create_table "exercise_strenght_tests", force: :cascade do |t|
    t.text    "mr_weights"
    t.integer "user_id"
    t.integer "exercise_id"
    t.date    "took_on"
    t.decimal "precision",   precision: 4, scale: 2, default: "1.0"
    t.string  "unit",                                default: "kg"
    t.index ["exercise_id"], name: "index_exercise_strenght_tests_on_exercise_id", using: :btree
    t.index ["user_id"], name: "index_exercise_strenght_tests_on_user_id", using: :btree
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_exercises_on_user_id", using: :btree
  end

  create_table "repetitions_signatures", force: :cascade do |t|
    t.string   "signature"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_repetitions_signatures_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "email"
    t.json     "tokens"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "exercise_strenght_tests", "exercises"
  add_foreign_key "exercise_strenght_tests", "users"
  add_foreign_key "exercises", "users"
  add_foreign_key "repetitions_signatures", "users"
end
