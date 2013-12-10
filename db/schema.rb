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

ActiveRecord::Schema.define(version: 20131210010354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "causes", force: true do |t|
    t.string   "cause_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "customer_username"
    t.string   "customer_email"
    t.string   "customer_hashed_password"
    t.string   "customer_salt"
    t.string   "customer_name"
    t.string   "customer_address"
    t.string   "customer_city"
    t.string   "customer_state"
    t.integer  "customer_zipcode"
    t.string   "customer_phone"
    t.string   "CC_number"
    t.string   "CC_name"
    t.string   "security"
    t.string   "code"
    t.string   "CC_expiration_date"
    t.string   "customer_shipping_address"
    t.string   "customer_shipping_city"
    t.string   "customer_shipping_state"
    t.integer  "customer_shipping_zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "images", force: true do |t|
    t.string   "direct_upload_url"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.boolean  "processed",           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "order_number"
    t.date     "ordered_date"
    t.date     "pending_date"
    t.date     "completed_date"
    t.date     "cancel_date"
    t.boolean  "achived_state"
    t.boolean  "product_purchased"
    t.integer  "customer_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["store_id"], name: "index_orders_on_store_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "product_name"
    t.string   "product_description"
    t.string   "product_image"
    t.decimal  "product_price"
    t.integer  "product_quantity"
    t.integer  "product_avail_inventory"
    t.decimal  "product_total_cost"
    t.integer  "category_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["store_id"], name: "index_products_on_store_id", using: :btree

  create_table "sellers", force: true do |t|
    t.string   "seller_username"
    t.string   "email"
    t.string   "salt"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "store_id"
  end

  add_index "sellers", ["store_id"], name: "index_sellers_on_store_id", using: :btree

  create_table "stores", force: true do |t|
    t.string   "store_name"
    t.string   "store_description"
    t.string   "store_image"
    t.integer  "cause_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["cause_id"], name: "index_stores_on_cause_id", using: :btree

end
