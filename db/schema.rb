# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_07_202411) do
  create_table "buildings", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "kio_building_id"
    t.string "name"
    t.string "address"
    t.integer "client_id"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "api_key"
    t.string "user"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "client_id"
    t.string "kio_device_id"
    t.string "unique_id"
    t.string "device_type"
    t.string "model"
    t.string "product"
    t.string "firmware"
    t.string "order_id"
    t.datetime "last_seen"
    t.string "mac"
    t.string "deployment_status"
    t.text "telemetry_fields", size: :long, collation: "utf8mb4_bin"
    t.integer "battery_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "json_valid(`telemetry_fields`)", name: "telemetry_fields"
  end

  create_table "floors", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "client_id"
    t.integer "kio_floor_id"
    t.string "name"
    t.integer "kio_building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "kio_room_id"
    t.float "x"
    t.float "y"
    t.datetime "last_update"
    t.string "kio_device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presences", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "kio_room_id"
    t.string "kio_device_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "client_id"
    t.integer "kio_room_id"
    t.string "name"
    t.integer "kio_floor_id"
    t.integer "kio_building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
