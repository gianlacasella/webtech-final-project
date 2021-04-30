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

ActiveRecord::Schema.define(version: 2021_04_30_013744) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.datetime "date"
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "target_id"
    t.integer "user_id"
    t.index ["target_id"], name: "index_complaints_on_target_id"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guest_reviews", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "score"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "host_id"
    t.index ["host_id"], name: "index_guest_reviews_on_host_id"
    t.index ["user_id"], name: "index_guest_reviews_on_user_id"
  end

  create_table "inboxes", force: :cascade do |t|
    t.string "text_user"
    t.string "text_host"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "pre_reservation_id"
    t.index ["pre_reservation_id"], name: "index_inboxes_on_pre_reservation_id"
    t.index ["user_id"], name: "index_inboxes_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "encoding"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "language_id", null: false
  end

  create_table "lodge_reviews", force: :cascade do |t|
    t.string "description"
    t.datetime "date"
    t.string "title"
    t.float "arrival_experience"
    t.float "price_score"
    t.float "communication_score"
    t.float "cleaning_score"
    t.float "location_score"
    t.float "host_reliability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "lodge_id"
    t.index ["lodge_id"], name: "index_lodge_reviews_on_lodge_id"
    t.index ["user_id"], name: "index_lodge_reviews_on_user_id"
  end

  create_table "lodges", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "address"
    t.integer "number_of_beds"
    t.integer "number_of_bathrooms"
    t.integer "number_of_rooms"
    t.boolean "gym"
    t.boolean "pool"
    t.boolean "jacuzzi"
    t.string "conditions"
    t.string "description"
    t.boolean "kitchen"
    t.boolean "air_conditioner"
    t.boolean "warm_water"
    t.boolean "shampoo"
    t.integer "parking_slots"
    t.boolean "bed_sheet"
    t.boolean "clothespin"
    t.boolean "heating"
    t.string "video_directory"
    t.string "photo_directory"
    t.boolean "work_zone"
    t.boolean "wifi"
    t.integer "tv"
    t.boolean "smoke_detector"
    t.boolean "first_aid_kit"
    t.boolean "refrigerator"
    t.boolean "microwave"
    t.time "check_in"
    t.time "check_out"
    t.boolean "smoking_allowed"
    t.boolean "parties_allowed"
    t.boolean "pets_allowed"
    t.boolean "kids_allowed"
    t.integer "people_allowed"
    t.float "arrival_experience_score"
    t.float "host_reliability_score"
    t.float "location_score"
    t.float "cleaning_score"
    t.float "price_score"
    t.float "host_comunication_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "type_id"
    t.float "x_cord"
    t.float "y_cord"
    t.integer "city_id"
    t.index ["city_id"], name: "index_lodges_on_city_id"
    t.index ["type_id"], name: "index_lodges_on_type_id"
    t.index ["user_id"], name: "index_lodges_on_user_id"
  end

  create_table "password_recoverers", force: :cascade do |t|
    t.boolean "email_sent"
    t.string "key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_password_recoverers_on_user_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_phone_numbers_on_user_id"
  end

  create_table "pre_reservations", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "pre_reservation_date_time"
    t.integer "number_of_people"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lodge_id"
    t.boolean "confirmed"
    t.index ["lodge_id"], name: "index_pre_reservations_on_lodge_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.float "host_score"
    t.float "guest_score"
    t.datetime "last_access"
    t.datetime "registration_date"
    t.string "email"
    t.date "birthday"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture"
    t.string "biography"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "city_id"
    t.string "phone_number"
    t.boolean "is_admin"
    t.boolean "is_host"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "complaints", "users"
  add_foreign_key "complaints", "users", column: "target_id"
  add_foreign_key "guest_reviews", "users"
  add_foreign_key "guest_reviews", "users", column: "host_id"
  add_foreign_key "inboxes", "pre_reservations"
  add_foreign_key "inboxes", "users"
  add_foreign_key "lodge_reviews", "lodges"
  add_foreign_key "lodge_reviews", "users"
  add_foreign_key "lodges", "cities"
  add_foreign_key "lodges", "types"
  add_foreign_key "lodges", "users"
  add_foreign_key "password_recoverers", "users"
  add_foreign_key "phone_numbers", "users"
  add_foreign_key "pre_reservations", "lodges"
  add_foreign_key "users", "cities"
end
