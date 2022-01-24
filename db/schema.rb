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

ActiveRecord::Schema.define(version: 2022_01_23_224136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listing_addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_listing_addresses_on_listing_id"
  end

  create_table "listing_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "likes"
    t.string "tags"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_listing_comments_on_listing_id"
  end

  create_table "listing_infos", force: :cascade do |t|
    t.string "listing_type"
    t.boolean "published"
    t.datetime "published_at", precision: 6
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_listing_infos_on_pet_id"
    t.index ["user_id"], name: "index_listing_infos_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.datetime "date_lost_found", precision: 6
    t.text "msg_from"
    t.text "description"
    t.bigint "listing_info_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_info_id"], name: "index_listings_on_listing_info_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "species"
    t.string "name"
    t.string "age"
    t.string "size"
    t.text "description"
    t.string "breed"
    t.string "gender"
    t.string "color"
    t.integer "microchip"
    t.integer "height"
    t.integer "weight"
    t.string "coat"
    t.boolean "collar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "home_phone"
    t.string "cell_phone"
    t.string "job_title"
    t.string "company"
    t.string "website"
    t.string "blog"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "listing_addresses", "listings"
  add_foreign_key "listing_comments", "listings"
  add_foreign_key "listing_infos", "pets"
  add_foreign_key "listing_infos", "users"
  add_foreign_key "listings", "listing_infos"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_profiles", "users"
end