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

ActiveRecord::Schema[7.1].define(version: 2024_01_26_203924) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "key"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_api_keys_on_account_id"
  end

  create_table "functions", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifiers", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["value"], name: "index_identifiers_on_value"
  end

  create_table "ingredient_functions", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "function_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["function_id"], name: "index_ingredient_functions_on_function_id"
    t.index ["ingredient_id"], name: "index_ingredient_functions_on_ingredient_id"
  end

  create_table "ingredient_identifiers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "identifier_id"
    t.bigint "ingredient_id"
    t.index ["identifier_id"], name: "index_ingredient_identifiers_on_identifier_id"
    t.index ["ingredient_id"], name: "index_ingredient_identifiers_on_ingredient_id"
  end

  create_table "ingredient_regulations", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "regulation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_regulations_on_ingredient_id"
    t.index ["regulation_id"], name: "index_ingredient_regulations_on_regulation_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.text "cosing_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regulations", force: :cascade do |t|
    t.string "type"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "api_keys", "accounts"
  add_foreign_key "ingredient_functions", "functions"
  add_foreign_key "ingredient_functions", "ingredients"
  add_foreign_key "ingredient_identifiers", "identifiers"
  add_foreign_key "ingredient_identifiers", "ingredients"
  add_foreign_key "ingredient_regulations", "ingredients"
  add_foreign_key "ingredient_regulations", "regulations"
end
