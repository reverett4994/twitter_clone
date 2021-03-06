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

ActiveRecord::Schema.define(version: 20160824083051) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "friendable_id",   limit: 4
    t.string   "friendable_type", limit: 255
    t.integer  "friend_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id",      limit: 4
    t.integer  "status",          limit: 4
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "content",            limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",            limit: 255
    t.string   "email",               limit: 255
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "password_digest",     limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.text     "about",               limit: 65535
  end

end
