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

ActiveRecord::Schema.define(version: 20151028101351) do

  create_table "debt_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "debt_groups", ["user_id"], name: "index_debt_groups_on_user_id"

  create_table "debts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "name"
    t.integer  "stock",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "debts", ["group_id"], name: "index_debts_on_group_id"
  add_index "debts", ["user_id", "group_id"], name: "index_debts_on_user_id_and_group_id"
  add_index "debts", ["user_id"], name: "index_debts_on_user_id"

  create_table "flows", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "credit_type"
    t.string   "credit_id"
    t.string   "integer"
    t.string   "debit_type"
    t.integer  "debit_id"
    t.datetime "date"
    t.string   "memo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "journals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "debit_type"
    t.integer  "debit_id"
    t.integer  "credit_type"
    t.integer  "credit_id"
    t.integer  "amount"
    t.date     "trade_date"
    t.string   "memo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "journals", ["user_id", "trade_date"], name: "index_journals_on_user_id_and_trade_date"

  create_table "loss_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "loss_groups", ["user_id"], name: "index_loss_groups_on_user_id"

  create_table "losses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "name"
    t.integer  "budget",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "stock",      default: 0, null: false
  end

  add_index "losses", ["group_id"], name: "index_losses_on_group_id"
  add_index "losses", ["user_id", "group_id"], name: "index_losses_on_user_id_and_group_id"
  add_index "losses", ["user_id"], name: "index_losses_on_user_id"

  create_table "profit_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profit_groups", ["user_id"], name: "index_profit_groups_on_user_id"

  create_table "profits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "name"
    t.integer  "budget",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "stock",      default: 0, null: false
  end

  add_index "profits", ["group_id"], name: "index_profits_on_group_id"
  add_index "profits", ["user_id", "group_id"], name: "index_profits_on_user_id_and_group_id"
  add_index "profits", ["user_id"], name: "index_profits_on_user_id"

  create_table "properties", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "name"
    t.integer  "stock",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "properties", ["group_id"], name: "index_properties_on_group_id"
  add_index "properties", ["user_id", "group_id"], name: "index_properties_on_user_id_and_group_id"
  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "property_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "property_groups", ["user_id"], name: "index_property_groups_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
