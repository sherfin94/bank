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

ActiveRecord::Schema.define(version: 20160819112522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loans", force: :cascade do |t|
    t.string   "borrower_name"
    t.integer  "loan_number"
    t.float    "principal_loan_amount"
    t.datetime "closing_date"
    t.datetime "first_payment_date"
    t.float    "interest_rate"
    t.integer  "term"
    t.string   "loan_type"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.datetime "request_time"
    t.string   "status"
  end

  create_table "payments", force: :cascade do |t|
    t.date     "payment_date"
    t.float    "beginning_balance"
    t.float    "principal_payment"
    t.float    "total_payment"
    t.float    "ending_balance"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "loan_id"
  end

end
