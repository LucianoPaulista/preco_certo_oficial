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

ActiveRecord::Schema.define(version: 2022_02_11_021743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixed_expenses", force: :cascade do |t|
    t.string "description"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "markup_items", force: :cascade do |t|
    t.string "description"
    t.float "percentage"
    t.bigint "markup_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["markup_id"], name: "index_markup_items_on_markup_id"
  end

  create_table "markups", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parameters", force: :cascade do |t|
    t.float "pro_labore"
    t.integer "worked_days_month"
    t.float "hours_worked_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_items", force: :cascade do |t|
    t.string "component"
    t.float "consumption"
    t.bigint "raw_material_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_items_on_product_id"
    t.index ["raw_material_id"], name: "index_product_items_on_raw_material_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "description"
    t.string "unity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string "description"
    t.string "unity"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "markup_items", "markups"
  add_foreign_key "product_items", "products"
  add_foreign_key "product_items", "raw_materials"
end
