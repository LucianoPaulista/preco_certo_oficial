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
