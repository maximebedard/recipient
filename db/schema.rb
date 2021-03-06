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

ActiveRecord::Schema.define(version: 20150221184507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.decimal  "serving_value"
    t.string   "serving_unit"
    t.decimal  "calories_value"
    t.string   "calories_unit"
    t.decimal  "fat_value"
    t.string   "fat_unit"
    t.decimal  "saturated_fat_value"
    t.string   "saturated_fat_unit"
    t.decimal  "trans_fat_value"
    t.string   "trans_fat_unit"
    t.decimal  "cholesterol_value"
    t.string   "cholesterol_unit"
    t.decimal  "sodium_value"
    t.string   "sodium_unit"
    t.decimal  "carbohydrate_value"
    t.string   "carbohydrate_unit"
    t.decimal  "fibre_value"
    t.string   "fibre_unit"
    t.decimal  "vitamin_a_value"
    t.string   "vitamin_a_unit"
    t.decimal  "vitamin_c_value"
    t.string   "vitamin_c_unit"
    t.decimal  "calcium_value"
    t.string   "calcium_unit"
    t.decimal  "iron_value"
    t.string   "iron_unit"
    t.decimal  "sugar_value"
    t.string   "sugar_unit"
    t.decimal  "protein_value"
    t.string   "protein_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.integer  "order"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_items", force: true do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.decimal  "quantity_value"
    t.string   "quantity_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.integer  "preperation_time"
    t.integer  "total_time"
    t.integer  "user_id"
    t.decimal  "serving_value"
    t.string   "serving_unit"
    t.decimal  "calories_value"
    t.string   "calories_unit"
    t.decimal  "fat_value"
    t.string   "fat_unit"
    t.decimal  "saturated_fat_value"
    t.string   "saturated_fat_unit"
    t.decimal  "trans_fat_value"
    t.string   "trans_fat_unit"
    t.decimal  "cholesterol_value"
    t.string   "cholesterol_unit"
    t.decimal  "sodium_value"
    t.string   "sodium_unit"
    t.decimal  "carbohydrate_value"
    t.string   "carbohydrate_unit"
    t.decimal  "fibre_value"
    t.string   "fibre_unit"
    t.decimal  "vitamin_a_value"
    t.string   "vitamin_a_unit"
    t.decimal  "vitamin_c_value"
    t.string   "vitamin_c_unit"
    t.decimal  "calcium_value"
    t.string   "calcium_unit"
    t.decimal  "iron_value"
    t.string   "iron_unit"
    t.decimal  "sugar_value"
    t.string   "sugar_unit"
    t.decimal  "protein_value"
    t.string   "protein_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "stars", force: true do |t|
    t.integer  "starrable_id"
    t.string   "starrable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stars", ["user_id", "starrable_id", "starrable_type"], name: "by_user_and_starrable", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer "taggable_id"
    t.string  "taggable_type"
    t.integer "tag_id"
  end

  add_index "taggings", ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.string   "color"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
