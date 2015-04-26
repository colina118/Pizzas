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

ActiveRecord::Schema.define(version: 20150426012749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.text     "adress",       null: false
    t.integer  "postal_code",  null: false
    t.string   "phone_number", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "lastname",     null: false
    t.string   "phone_number", null: false
    t.text     "address",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "lastname",        null: false
    t.string   "user",            null: false
    t.integer  "branch_id",       null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "employees", ["branch_id"], name: "index_employees_on_branch_id", using: :btree

  create_table "ingridients", force: :cascade do |t|
    t.text     "name",       null: false
    t.float    "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingridients_pizzas", force: :cascade do |t|
    t.integer  "pizza_id",      null: false
    t.integer  "ingridient_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ingridients_pizzas", ["ingridient_id"], name: "index_ingridients_pizzas_on_ingridient_id", using: :btree
  add_index "ingridients_pizzas", ["pizza_id"], name: "index_ingridients_pizzas_on_pizza_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.integer  "employee_id", null: false
    t.string   "shift",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "managers", ["employee_id"], name: "index_managers_on_employee_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id",  null: false
    t.integer  "branch_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["branch_id"], name: "index_orders_on_branch_id", using: :btree
  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree

  create_table "orders_pizzas", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "pizza_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders_pizzas", ["order_id"], name: "index_orders_pizzas_on_order_id", using: :btree
  add_index "orders_pizzas", ["pizza_id"], name: "index_orders_pizzas_on_pizza_id", using: :btree

  create_table "pizzas", force: :cascade do |t|
    t.text     "name"
    t.float    "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "branches"
  add_foreign_key "ingridients_pizzas", "ingridients"
  add_foreign_key "ingridients_pizzas", "pizzas"
  add_foreign_key "managers", "employees"
  add_foreign_key "orders", "branches"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders_pizzas", "orders"
  add_foreign_key "orders_pizzas", "pizzas"
end
