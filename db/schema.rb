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

ActiveRecord::Schema.define(version: 2020_07_24_085016) do

  create_table "companies", force: :cascade do |t|
    t.integer "user_id"
    t.string "image_id"
    t.string "industry"
    t.integer "sale"
    t.integer "operating_income"
    t.integer "disposal_desired_price"
    t.text "company_address"
    t.integer "fiscal_year"
    t.integer "total_asset"
    t.integer "interest_bearing_debt"
    t.integer "net_asset"
    t.integer "employee_number"
    t.text "transfer_target_asset"
    t.text "transfer_reason"
    t.text "business_overview"
    t.text "customer"
    t.text "product_service"
    t.text "business_strength"
    t.text "supplement_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
  end

  create_table "company_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "surname"
    t.string "first_name"
    t.string "surname_kana"
    t.string "first_name_kana"
    t.string "postal_code"
    t.text "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
