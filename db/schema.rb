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

ActiveRecord::Schema.define(version: 20150401083526) do

  create_table "air_moistures", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "air_moistures", ["disease_id"], name: "index_air_moistures_on_disease_id"

  create_table "area_type_certainty_factors", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "area_type_id"
    t.decimal  "cf"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "area_type_certainty_factors", ["area_type_id"], name: "index_area_type_certainty_factors_on_area_type_id"
  add_index "area_type_certainty_factors", ["disease_id"], name: "index_area_type_certainty_factors_on_disease_id"

  create_table "area_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["content_id"], name: "index_comments_on_content_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "content_images", force: :cascade do |t|
    t.string   "title"
    t.integer  "content_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "content_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "content_images_id"
    t.integer  "content_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "contents", ["content_images_id"], name: "index_contents_on_content_images_id"
  add_index "contents", ["content_type_id"], name: "index_contents_on_content_type_id"

  create_table "cultivated_areas", force: :cascade do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "plantation_id"
    t.integer  "user_id"
    t.integer  "area_type_id"
    t.integer  "soil_type_id"
    t.integer  "province_id"
    t.date     "plantation_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "cultivated_areas", ["area_type_id"], name: "index_cultivated_areas_on_area_type_id"
  add_index "cultivated_areas", ["plantation_id"], name: "index_cultivated_areas_on_plantation_id"
  add_index "cultivated_areas", ["province_id"], name: "index_cultivated_areas_on_province_id"
  add_index "cultivated_areas", ["soil_type_id"], name: "index_cultivated_areas_on_soil_type_id"
  add_index "cultivated_areas", ["user_id"], name: "index_cultivated_areas_on_user_id"

  create_table "disease_names", force: :cascade do |t|
    t.string   "name"
    t.integer  "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "disease_names", ["disease_id"], name: "index_disease_names_on_disease_id"

  create_table "diseases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecologies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecology_certainty_factors", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "ecology_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ecology_certainty_factors", ["disease_id"], name: "index_ecology_certainty_factors_on_disease_id"
  add_index "ecology_certainty_factors", ["ecology_id"], name: "index_ecology_certainty_factors_on_ecology_id"

  create_table "nitrogens", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "stage_id"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "nitrogens", ["disease_id"], name: "index_nitrogens_on_disease_id"
  add_index "nitrogens", ["stage_id"], name: "index_nitrogens_on_stage_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "cultivated_area_id"
  end

  add_index "notifications", ["cultivated_area_id"], name: "index_notifications_on_cultivated_area_id"
  add_index "notifications", ["disease_id"], name: "index_notifications_on_disease_id"

  create_table "phosphorus", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "stage_id"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phosphorus", ["disease_id"], name: "index_phosphorus_on_disease_id"
  add_index "phosphorus", ["stage_id"], name: "index_phosphorus_on_stage_id"

  create_table "plantation_certainty_factors", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "plantation_id"
    t.decimal  "cf"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "plantation_certainty_factors", ["disease_id"], name: "index_plantation_certainty_factors_on_disease_id"
  add_index "plantation_certainty_factors", ["plantation_id"], name: "index_plantation_certainty_factors_on_plantation_id"

  create_table "plantations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "potassia", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "stage_id"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "potassia", ["disease_id"], name: "index_potassia_on_disease_id"
  add_index "potassia", ["stage_id"], name: "index_potassia_on_stage_id"

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "provinces", ["region_id"], name: "index_provinces_on_region_id"

  create_table "rains", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rains", ["disease_id"], name: "index_rains_on_disease_id"

  create_table "rates", force: :cascade do |t|
    t.integer  "score"
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rates", ["content_id"], name: "index_rates_on_content_id"
  add_index "rates", ["user_id"], name: "index_rates_on_user_id"

  create_table "region_certainty_factors", force: :cascade do |t|
    t.integer  "region_id"
    t.integer  "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "cf"
  end

  add_index "region_certainty_factors", ["disease_id"], name: "index_region_certainty_factors_on_disease_id"
  add_index "region_certainty_factors", ["region_id"], name: "index_region_certainty_factors_on_region_id"

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "soil_moistures", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "soil_moistures", ["disease_id"], name: "index_soil_moistures_on_disease_id"

  create_table "soil_type_certainty_factors", force: :cascade do |t|
    t.integer  "disease_id"
    t.integer  "soil_type_id"
    t.decimal  "cf"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "soil_type_certainty_factors", ["disease_id"], name: "index_soil_type_certainty_factors_on_disease_id"
  add_index "soil_type_certainty_factors", ["soil_type_id"], name: "index_soil_type_certainty_factors_on_soil_type_id"

  create_table "soil_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stage_certainty_factors", force: :cascade do |t|
    t.decimal  "cf"
    t.integer  "stage_id"
    t.integer  "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stage_certainty_factors", ["disease_id"], name: "index_stage_certainty_factors_on_disease_id"
  add_index "stage_certainty_factors", ["stage_id"], name: "index_stage_certainty_factors_on_stage_id"

  create_table "stages", force: :cascade do |t|
    t.string   "name"
    t.integer  "min_day"
    t.integer  "max_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temperatures", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "temperatures", ["disease_id"], name: "index_temperatures_on_disease_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "identification_number"
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "winds", force: :cascade do |t|
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "disease_id"
    t.decimal  "cf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "winds", ["disease_id"], name: "index_winds_on_disease_id"

end
