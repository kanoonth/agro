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

ActiveRecord::Schema.define(version: 20150304112340) do

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
