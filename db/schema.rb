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

ActiveRecord::Schema.define(version: 2019_12_03_093925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "alerts", force: :cascade do |t|
    t.string "type_of_alert"
    t.string "message"
    t.bigint "patch_plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["patch_plant_id"], name: "index_alerts_on_patch_plant_id"
  end

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
    t.boolean "jan"
    t.boolean "feb"
    t.boolean "mar"
    t.boolean "apr"
    t.boolean "may"
    t.boolean "jun"
    t.boolean "jul"
    t.boolean "aug"
    t.boolean "oct"
    t.boolean "nov"
    t.boolean "dec"
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
    t.string "growing_time"
  end

  create_table "sowing_months", force: :cascade do |t|
    t.boolean "jan"
    t.boolean "feb"
    t.boolean "mar"
    t.boolean "apr"
    t.boolean "may"
    t.boolean "jun"
    t.boolean "jul"
    t.boolean "aug"
    t.boolean "oct"
    t.boolean "nov"
    t.boolean "dec"
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
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weather_alerts", force: :cascade do |t|
    t.string "type_of_alert"
    t.string "message"
    t.bigint "patch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["patch_id"], name: "index_weather_alerts_on_patch_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "alerts", "patch_plants"
  add_foreign_key "daily_weather_reports", "patches"
  add_foreign_key "harvest_months", "plants"
  add_foreign_key "patch_plants", "patches"
  add_foreign_key "patch_plants", "plants"
  add_foreign_key "patches", "users"
  add_foreign_key "sowing_months", "plants"
  add_foreign_key "weather_alerts", "patches"
end
