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

ActiveRecord::Schema.define(version: 20141016012657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comics", force: true do |t|
    t.string   "name",          null: false
    t.string   "creators",      null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",       null: false
    t.string   "cover_img_url"
    t.string   "cover_image"
  end

  create_table "elements", force: true do |t|
    t.string   "image_url"
    t.string   "alt_text"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "id_name",                        null: false
    t.integer  "page_id",                        null: false
    t.integer  "user_id",                        null: false
    t.string   "image_file"
    t.text     "css"
    t.text     "js"
    t.string   "position",   default: "none",    null: false
    t.string   "align",      default: "default", null: false
    t.integer  "z"
  end

  add_index "elements", ["page_id"], name: "index_elements_on_page_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "chapter",                     null: false
    t.string   "name"
    t.integer  "number",                      null: false
    t.string   "page_type",  default: "page", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comic_id"
    t.integer  "user_id",                     null: false
  end

  add_index "pages", ["chapter", "number"], name: "index_pages_on_chapter_and_number", using: :btree
  add_index "pages", ["comic_id"], name: "index_pages_on_comic_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                                  null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
