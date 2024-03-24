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

ActiveRecord::Schema[7.1].define(version: 2024_03_24_112751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.decimal "total"
    t.bigint "incomes_id"
    t.bigint "expenses_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expenses_id"], name: "index_balances_on_expenses_id"
    t.index ["incomes_id"], name: "index_balances_on_incomes_id"
    t.index ["users_id"], name: "index_balances_on_users_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "name"
    t.boolean "flg_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "supplier"
    t.decimal "amount"
    t.boolean "flg_deleted", default: false
    t.bigint "users_id"
    t.bigint "expense_types_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_types_id"], name: "index_expenses_on_expense_types_id"
    t.index ["users_id"], name: "index_expenses_on_users_id"
  end

  create_table "income_types", force: :cascade do |t|
    t.string "name"
    t.boolean "flg_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.decimal "amount"
    t.string "source"
    t.boolean "flg_deleted", default: false
    t.bigint "users_id"
    t.bigint "income_types_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_types_id"], name: "index_incomes_on_income_types_id"
    t.index ["users_id"], name: "index_incomes_on_users_id"
  end

  create_table "target_expenses", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.string "supplier"
    t.string "product_url"
    t.boolean "flg_deleted", default: false
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_target_expenses_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.boolean "is_admin"
    t.string "location"
    t.boolean "flg_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
