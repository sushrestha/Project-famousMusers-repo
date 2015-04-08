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

ActiveRecord::Schema.define(version: 20150407204713) do

  create_table "musers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "isModerator"
  end

  add_index "musers", ["email"], name: "index_musers_on_email", unique: true

  create_table "musings", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "isPrivate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "muser_id"
  end

  add_index "musings", ["muser_id"], name: "index_musings_on_muser_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "musing_id"
  end

  add_index "ratings", ["musing_id"], name: "index_ratings_on_musing_id"

end
