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

ActiveRecord::Schema.define(version: 20141007185245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comics", force: true do |t|
    t.string   "name",        null: false
    t.string   "creators",    null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", force: true do |t|
    t.string   "image_url",                       null: false
    t.string   "alt_text"
    t.text     "notes"
    t.integer  "x"
    t.integer  "y"
    t.integer  "z"
    t.string   "animation_type", default: "none", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "id_name"
    t.integer  "page_id",                         null: false
  end

  add_index "elements", ["page_id"], name: "index_elements_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "chapter",                     null: false
    t.string   "name"
    t.integer  "number",                      null: false
    t.string   "page_type",  default: "page", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comic_id"
  end

  add_index "pages", ["comic_id"], name: "index_pages_on_comic_id", using: :btree

end
