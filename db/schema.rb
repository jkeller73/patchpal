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

ActiveRecord::Schema.define(version: 2019_11_26_152454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_weather_reports", force: :cascade do |t|
    t.date "date"
    t.text "description"
    t.float "temperature"
    t.bigint "patch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patch_id"], name: "index_daily_weather_reports_on_patch_id"
  end

  create_table "harvest_months", force: :cascade do |t|
    t.boolean "jan", default: false
    t.boolean "feb", default: false
    t.boolean "mar", default: false
    t.boolean "apr", default: false
    t.boolean "may", default: false
    t.boolean "jun", default: false
    t.boolean "jul", default: false
    t.boolean "aug", default: false
    t.boolean "oct", default: false
    t.boolean "nov", default: false
    t.boolean "dec", default: false
    t.bigint "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sep"
    t.index ["plant_id"], name: "index_harvest_months_on_plant_id"
  end

  create_table "patch_plants", force: :cascade do |t|
    t.date "plant_date"
    t.date "harvest_date"
    t.bigint "plant_id"
    t.bigint "patch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patch_id"], name: "index_patch_plants_on_patch_id"
    t.index ["plant_id"], name: "index_patch_plants_on_plant_id"
  end

  create_table "patches", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patches_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "hardiness"
    t.string "position_in"
    t.text "sowing"
    t.text "more_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "sowing_months", force: :cascade do |t|
    t.boolean "jan", default: false
    t.boolean "feb", default: false
    t.boolean "mar", default: false
    t.boolean "apr", default: false
    t.boolean "may", default: false
    t.boolean "jun", default: false
    t.boolean "jul", default: false
    t.boolean "aug", default: false
    t.boolean "oct", default: false
    t.boolean "nov", default: false
    t.boolean "dec", default: false
    t.bigint "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sep"
    t.index ["plant_id"], name: "index_sowing_months_on_plant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_weather_reports", "patches"
  add_foreign_key "harvest_months", "plants"
  add_foreign_key "patch_plants", "patches"
  add_foreign_key "patch_plants", "plants"
  add_foreign_key "patches", "users"
  add_foreign_key "sowing_months", "plants"
end
