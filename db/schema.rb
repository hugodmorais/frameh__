# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_17_222134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.boolean "main_account"
    t.boolean "credit_account"
    t.boolean "savings_account"
    t.string "description"
    t.string "country"
    t.bigint "currency_kind_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_kind_id"], name: "index_accounts_on_currency_kind_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "annual_managements", force: :cascade do |t|
    t.integer "year", null: false
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_annual_managements_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "country", default: "", null: false
    t.string "city"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contract_statuses", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contract_statuses_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name", null: false
    t.string "number"
    t.string "description"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "job"
    t.bigint "contract_status_id"
    t.bigint "user_group_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contracts_on_company_id"
    t.index ["contract_status_id"], name: "index_contracts_on_contract_status_id"
    t.index ["user_group_id"], name: "index_contracts_on_user_group_id"
  end

  create_table "currency_kinds", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_currency_kinds_on_user_id"
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.boolean "primary_payment", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_expense_categories_on_user_id"
  end

  create_table "expense_groups", force: :cascade do |t|
    t.integer "expense_value"
    t.boolean "status", default: false
    t.bigint "expense_id"
    t.bigint "group_id"
    t.bigint "expense_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_category_id"], name: "index_expense_groups_on_expense_category_id"
    t.index ["expense_id"], name: "index_expense_groups_on_expense_id"
    t.index ["group_id"], name: "index_expense_groups_on_group_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "month"
    t.integer "kind"
    t.bigint "user_id"
    t.bigint "annual_management_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annual_management_id"], name: "index_expenses_on_annual_management_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "financial_statements", force: :cascade do |t|
    t.integer "month"
    t.decimal "total_balance"
    t.bigint "annual_management_id"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_financial_statements_on_account_id"
    t.index ["annual_management_id"], name: "index_financial_statements_on_annual_management_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "expense_category_id"
    t.integer "expense_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_category_id"], name: "index_groups_on_expense_category_id"
  end

  create_table "income_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_income_categories_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "month", null: false
    t.integer "kind"
    t.decimal "income_value", null: false
    t.text "comment"
    t.bigint "user_group_id"
    t.bigint "company_id"
    t.bigint "user_id"
    t.bigint "annual_management_id"
    t.bigint "income_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annual_management_id"], name: "index_incomes_on_annual_management_id"
    t.index ["company_id"], name: "index_incomes_on_company_id"
    t.index ["income_category_id"], name: "index_incomes_on_income_category_id"
    t.index ["user_group_id"], name: "index_incomes_on_user_group_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "payment_installments", force: :cascade do |t|
    t.string "name"
    t.date "start_date", null: false
    t.integer "months_number"
    t.decimal "total_value"
    t.string "store_name"
    t.string "description"
    t.decimal "deposit_money"
    t.decimal "monthly_installment"
    t.decimal "amount_already_paid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_installments_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "primary_payments"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "nif"
    t.string "card_identify"
    t.string "phone"
    t.text "comment"
    t.text "address"
    t.integer "genre"
    t.datetime "birth_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_groups", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "company_id"
    t.bigint "user_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_work_groups_on_company_id"
    t.index ["user_group_id"], name: "index_work_groups_on_user_group_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "annual_managements", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "contract_statuses", "users"
  add_foreign_key "currency_kinds", "users"
  add_foreign_key "expense_categories", "users"
  add_foreign_key "expenses", "annual_managements"
  add_foreign_key "expenses", "users"
  add_foreign_key "groups", "expense_categories"
  add_foreign_key "income_categories", "users"
  add_foreign_key "incomes", "annual_managements"
  add_foreign_key "incomes", "income_categories"
  add_foreign_key "incomes", "user_groups"
  add_foreign_key "incomes", "users"
  add_foreign_key "payment_installments", "users"
  add_foreign_key "settings", "users"
  add_foreign_key "user_groups", "users"
  add_foreign_key "work_groups", "companies"
  add_foreign_key "work_groups", "user_groups"
end
