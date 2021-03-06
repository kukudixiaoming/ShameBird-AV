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

ActiveRecord::Schema.define(version: 20160929050619) do

  create_table "albums", force: :cascade do |t|
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "albums", ["category_id"], name: "index_albums_on_category_id"

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "category_brief"
    t.string   "category_image"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "category_type"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment_text"
    t.string   "comment_author"
    t.string   "comment_email"
    t.string   "comment_site"
    t.integer  "post_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "microblogs", force: :cascade do |t|
    t.text     "text"
    t.string   "photo"
    t.string   "music"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "microblogs", ["category_id"], name: "index_microblogs_on_category_id"

  create_table "options", force: :cascade do |t|
    t.string   "site_header"
    t.string   "site_sub_header"
    t.string   "user_name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "post_title"
    t.text     "post_text"
    t.string   "post_image"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id"

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

end
