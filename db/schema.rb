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

ActiveRecord::Schema.define(version: 20150503175647) do

  

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competition_ratings", force: :cascade do |t|
    t.integer  "competitionstars"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "competition_id"
    t.integer  "musing_id"
  end

  add_index "competition_ratings", ["competition_id"], name: "index_competition_ratings_on_competition_id"
  add_index "competition_ratings", ["musing_id"], name: "index_competition_ratings_on_musing_id"

  create_table "competitions", force: :cascade do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions_musings", force: :cascade do |t|
    t.integer  "competition_id"
    t.integer  "musing_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "competitions_musings", ["competition_id"], name: "index_competitions_musings_on_competition_id"
  add_index "competitions_musings", ["musing_id"], name: "index_competitions_musings_on_musing_id"

  create_table "feedbacks", force: :cascade do |t|
    t.text     "response"
    t.integer  "musing_id"
    t.integer  "muser_id"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flagged_musings", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "musing_id"
    t.integer  "muser_id"
  end

  add_index "flagged_musings", ["muser_id"], name: "index_flagged_musings_on_muser_id"
  add_index "flagged_musings", ["musing_id"], name: "index_flagged_musings_on_musing_id"

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "author_id"
    t.integer  "recipient_id"
    t.string   "authorname"
  end

  create_table "musers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "isModerator",     default: false, null: false
    t.string   "name"
  end

  add_index "musers", ["email"], name: "index_musers_on_email", unique: true

  create_table "musings", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "isPrivate"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "muser_id"
    t.float    "averageCompetitionRating", default: 0.0, null: false
    t.integer  "category_id"
  end

  add_index "musings", ["category_id"], name: "index_musings_on_category_id"
  add_index "musings", ["muser_id"], name: "index_musings_on_muser_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "linktype"
    t.integer  "linkid"
    t.boolean  "unread"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "muser_id"
  end

  add_index "notifications", ["muser_id"], name: "index_notifications_on_muser_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "musing_id"
    t.integer  "muser_id"
  end

  add_index "ratings", ["muser_id"], name: "index_ratings_on_muser_id"
  add_index "ratings", ["musing_id"], name: "index_ratings_on_musing_id"

  create_table "subscribe_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "muser_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subscribes", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subscribes", ["followed_id"], name: "index_subscribes_on_followed_id"
  add_index "subscribes", ["follower_id", "followed_id"], name: "index_subscribes_on_follower_id_and_followed_id", unique: true
  add_index "subscribes", ["follower_id"], name: "index_subscribes_on_follower_id"

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
