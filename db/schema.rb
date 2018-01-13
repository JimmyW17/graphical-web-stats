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

ActiveRecord::Schema.define(version: 20180113163158) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "page_histories", force: :cascade do |t|
    t.integer "webpage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["webpage_id"], name: "index_page_histories_on_webpage_id"
  end

  create_table "page_sources", force: :cascade do |t|
    t.integer "page_history_id"
    t.text "html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_history_id"], name: "index_page_sources_on_page_history_id"
  end

  create_table "webpages", force: :cascade do |t|
    t.string "uuid"
    t.string "url"
    t.string "protocol"
    t.string "resource"
    t.string "domain"
    t.integer "checked_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_webpages_on_uuid", unique: true
  end

end
