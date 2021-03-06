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

ActiveRecord::Schema.define(version: 20190829130627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries_metadata", id: false, force: :cascade do |t|
    t.bigint "metadata_id", null: false
    t.bigint "country_id", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "language_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metadata", force: :cascade do |t|
    t.string "category", null: false
    t.string "resource"
    t.string "version"
    t.string "contact_organisation"
    t.string "dataset_id"
    t.string "website_download_link"
    t.boolean "metadata", null: false
    t.string "factsheet"
    t.boolean "marine_spatial_planning", null: false
    t.boolean "education", null: false
    t.boolean "environmental_impact_assessment", null: false
    t.boolean "ecosystem_assessment", null: false
    t.boolean "ecosystem_services", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "license_number"
    t.string "pdf_link"
    t.string "license_url"
    t.boolean "open_access"
    t.boolean "abnj_rel"
    t.boolean "abnj_proj"
  end

  create_table "metadata_languages", force: :cascade do |t|
    t.bigint "language_id"
    t.bigint "metadata_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metadata_regions", id: false, force: :cascade do |t|
    t.bigint "metadata_id", null: false
    t.bigint "region_id", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
