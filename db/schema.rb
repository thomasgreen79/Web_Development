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

ActiveRecord::Schema.define(version: 20151031053408) do

  create_table "image_elements", force: :cascade do |t|
    t.integer  "num"
    t.text     "path"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "image_elements", ["page_id"], name: "index_image_elements_on_page_id"

  create_table "pages", force: :cascade do |t|
    t.integer  "num"
    t.text     "layout"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["story_id"], name: "index_pages_on_story_id"

  create_table "stories", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "travelStyle"
    t.string   "storyType"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "text_elements", force: :cascade do |t|
    t.integer  "num"
    t.text     "content"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "text_elements", ["page_id"], name: "index_text_elements_on_page_id"

  create_table "users", force: :cascade do |t|
    t.string   "LastName"
    t.string   "FirstName"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
