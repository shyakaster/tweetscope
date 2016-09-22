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

ActiveRecord::Schema.define(version: 20160922134145) do

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image",      limit: 255
  end

  create_table "tweets", force: :cascade do |t|
    t.text    "tweet",            limit: 65535
    t.integer "keyword_id",       limit: 4
    t.string  "user_uid",         limit: 255
    t.string  "user_name",        limit: 255
    t.string  "user_screen_name", limit: 255
    t.string  "user_image_url",   limit: 255
    t.string  "tweet_id",         limit: 255
    t.string  "tweet_created_at", limit: 255
  end

  add_index "tweets", ["keyword_id"], name: "index_tweets_on_keyword_id", using: :btree

  add_foreign_key "tweets", "keywords"
end
