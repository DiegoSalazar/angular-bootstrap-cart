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

ActiveRecord::Schema.define(version: 20130801180924) do

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "variant_id"
    t.integer  "quantity"
    t.string   "status"
    t.string   "name"
    t.decimal  "price"
    t.integer  "savings_percentage"
    t.decimal  "savings_amount"
    t.string   "thumb_url"
    t.string   "image_url"
    t.string   "sale_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variants", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "savings_percentage"
    t.decimal  "savings_amount"
    t.string   "thumb_url"
    t.string   "image_url"
    t.string   "sale_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
