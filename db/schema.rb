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

ActiveRecord::Schema.define(version: 20160620233234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encounters", force: :cascade do |t|
    t.integer "visit_number",  null: false
    t.date    "admitted_at",   null: false
    t.date    "discharged_at", null: false
    t.string  "location"
    t.integer "room"
    t.integer "bed"
    t.integer "patient_id"
  end

  add_index "encounters", ["patient_id"], name: "index_encounters_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string  "first_name",  null: false
    t.string  "middle_name", null: false
    t.string  "last_name"
    t.integer "weight"
    t.integer "height"
    t.string  "mrn",         null: false
  end

  add_foreign_key "encounters", "patients"
end
