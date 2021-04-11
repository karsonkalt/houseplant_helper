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

ActiveRecord::Schema.define(version: 2021_04_04_023404) do

  create_table "plants", force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "user_id", null: false
    t.string "nickname"
    t.integer "water_frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["species_id"], name: "index_plants_on_species_id"
    t.index ["user_id"], name: "index_plants_on_user_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "common_name"
    t.integer "water_frequency"
    t.string "image_path"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "waterings", force: :cascade do |t|
    t.integer "plant_id", null: false
    t.datetime "datetime"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plant_id"], name: "index_waterings_on_plant_id"
  end

  add_foreign_key "plants", "species", on_delete: :cascade
  add_foreign_key "plants", "users", on_delete: :cascade
  add_foreign_key "waterings", "plants", on_delete: :cascade
end
