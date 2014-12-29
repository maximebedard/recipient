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

ActiveRecord::Schema.define(version: 20141228180559) do

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.decimal  "serving_value",             precision: 6, scale: 1, default: 0.0
    t.decimal  "calories_value",            precision: 6, scale: 1, default: 0.0
    t.decimal  "carbohydrates_value",       precision: 6, scale: 1, default: 0.0
    t.decimal  "fat_value",                 precision: 6, scale: 1, default: 0.0
    t.decimal  "proteins_value",            precision: 6, scale: 1, default: 0.0
    t.string   "serving_unit"
    t.string   "calories_unit"
    t.string   "carbohydrates_unit"
    t.string   "fat_unit"
    t.string   "proteins_unit"
    t.decimal  "calories_daily_value",      precision: 3, scale: 2
    t.decimal  "carbohydrates_daily_value", precision: 3, scale: 2
    t.decimal  "fat_daily_value",           precision: 3, scale: 2
    t.decimal  "proteins_daily_value",      precision: 3, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "value"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "servings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
