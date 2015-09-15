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

ActiveRecord::Schema.define(version: 20150903021814) do

  create_table "entries", primary_key: "entry_id", force: :cascade do |t|
    t.string   "entry_user_id",       limit: 16,                    null: false
    t.text     "entry_user_nickname", limit: 65535,                 null: false
    t.datetime "entry_time",                                        null: false
    t.integer  "game_id",             limit: 4,     default: 0,     null: false
    t.integer  "event_id",            limit: 4,     default: 0,     null: false
    t.text     "content",             limit: 65535,                 null: false
    t.text     "entry_tags_ids",      limit: 65535,                 null: false
    t.text     "reply_to",            limit: 65535,                 null: false
    t.boolean  "entry_type",                        default: false, null: false
    t.string   "parent_id",           limit: 16,                    null: false
    t.text     "relation_tag",        limit: 65535,                 null: false
    t.text     "image_path01",        limit: 65535,                 null: false
    t.text     "image_path02",        limit: 65535,                 null: false
    t.text     "image_path03",        limit: 65535,                 null: false
    t.text     "image_path04",        limit: 65535,                 null: false
    t.integer  "retweet_num",         limit: 4,     default: 0,     null: false
    t.integer  "favorite_num",        limit: 4,     default: 0,     null: false
    t.integer  "warning_num",         limit: 4,     default: 0,     null: false
    t.boolean  "delete_flag",                       default: false, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "entries", ["entry_user_id"], name: "entry_user_id", using: :btree

  create_table "events", primary_key: "event_id", force: :cascade do |t|
    t.integer  "game_id",          limit: 4,                     null: false
    t.text     "name",             limit: 65535,                 null: false
    t.text     "description",      limit: 65535,                 null: false
    t.integer  "tag_id",           limit: 4,     default: 0,     null: false
    t.text     "tag_name",         limit: 65535,                 null: false
    t.integer  "event_type",       limit: 4,     default: 0,     null: false
    t.integer  "revival_event_id", limit: 4,                     null: false
    t.datetime "start_date",                                     null: false
    t.datetime "finish_date",                                    null: false
    t.boolean  "delete_flag",                    default: false, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "events", ["game_id"], name: "idx_game_id", using: :btree

  create_table "favorites", id: false, force: :cascade do |t|
    t.string   "user_id",     limit: 16,                 null: false
    t.integer  "game_id",     limit: 4,                  null: false
    t.string   "entry_id",    limit: 16,                 null: false
    t.boolean  "delete_flag",            default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "followers", id: false, force: :cascade do |t|
    t.string   "user_id",          limit: 16,                 null: false
    t.integer  "game_id",          limit: 4,                  null: false
    t.string   "follower_user_id", limit: 16,                 null: false
    t.boolean  "delete_flag",                 default: false, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "follows", id: false, force: :cascade do |t|
    t.string   "user_id",        limit: 16,                 null: false
    t.integer  "game_id",        limit: 4,                  null: false
    t.string   "follow_user_id", limit: 16,                 null: false
    t.boolean  "delete_flag",               default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "game_profiles", id: false, force: :cascade do |t|
    t.string   "user_id",           limit: 16,                    null: false
    t.integer  "game_id",           limit: 4,                     null: false
    t.text     "comment",           limit: 65535,                 null: false
    t.text     "image_path01",      limit: 65535,                 null: false
    t.text     "image_path02",      limit: 65535,                 null: false
    t.text     "image_path03",      limit: 65535,                 null: false
    t.text     "image_path04",      limit: 65535,                 null: false
    t.text     "value01",           limit: 65535,                 null: false
    t.text     "value02",           limit: 65535,                 null: false
    t.text     "value03",           limit: 65535,                 null: false
    t.text     "value04",           limit: 65535,                 null: false
    t.text     "value05",           limit: 65535,                 null: false
    t.text     "value06",           limit: 65535,                 null: false
    t.text     "value07",           limit: 65535,                 null: false
    t.text     "value08",           limit: 65535,                 null: false
    t.text     "value09",           limit: 65535,                 null: false
    t.text     "value10",           limit: 65535,                 null: false
    t.date     "play_start_date",                                 null: false
    t.time     "login_start_time",                                null: false
    t.time     "login_finish_time",                               null: false
    t.boolean  "delete_flag",                     default: false, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "games", primary_key: "game_id", force: :cascade do |t|
    t.text     "name",               limit: 65535,                 null: false
    t.text     "description",        limit: 65535,                 null: false
    t.integer  "tag_id",             limit: 4,     default: 0,     null: false
    t.text     "tag_name",           limit: 65535,                 null: false
    t.text     "icon_image_path",    limit: 65535,                 null: false
    t.text     "header_image_path",  limit: 65535,                 null: false
    t.text     "web_view_url",       limit: 65535,                 null: false
    t.text     "profile_key_name01", limit: 65535,                 null: false
    t.text     "profile_key_name02", limit: 65535,                 null: false
    t.text     "profile_key_name03", limit: 65535,                 null: false
    t.text     "profile_key_name04", limit: 65535,                 null: false
    t.text     "profile_key_name05", limit: 65535,                 null: false
    t.text     "profile_key_name06", limit: 65535,                 null: false
    t.text     "profile_key_name07", limit: 65535,                 null: false
    t.text     "profile_key_name08", limit: 65535,                 null: false
    t.text     "profile_key_name09", limit: 65535,                 null: false
    t.text     "profile_key_name10", limit: 65535,                 null: false
    t.boolean  "delete_flag",                      default: false, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "tags", primary_key: "tag_id", force: :cascade do |t|
    t.text     "tag_name",    limit: 65535,                 null: false
    t.integer  "game_id",     limit: 4,     default: 0,     null: false
    t.integer  "event_id",    limit: 4,     default: 0,     null: false
    t.boolean  "delete_flag",               default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "timelines", id: false, force: :cascade do |t|
    t.string   "entry_id",      limit: 16,                  null: false
    t.string   "user_id",       limit: 16,                  null: false
    t.string   "entry_user_id", limit: 16,                  null: false
    t.datetime "entry_time",                                null: false
    t.integer  "game_id",       limit: 4,                   null: false
    t.integer  "event_id",      limit: 4,   default: 0,     null: false
    t.string   "tags",          limit: 255,                 null: false
    t.integer  "timeline_type", limit: 4,   default: 0,     null: false
    t.string   "reply_to",      limit: 255,                 null: false
    t.boolean  "retweet_flag",              default: false, null: false
    t.boolean  "favorite_flag",             default: false, null: false
    t.boolean  "warning_flag",              default: false, null: false
    t.boolean  "delete_flag",               default: false, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "timelines", ["user_id", "event_id"], name: "user_id_event_id", using: :btree
  add_index "timelines", ["user_id", "game_id", "timeline_type"], name: "user_id_game_id_type", using: :btree
  add_index "timelines", ["user_id", "game_id"], name: "user_id_game_id", using: :btree
  add_index "timelines", ["user_id"], name: "user_id", using: :btree

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string   "login_id",          limit: 16,                    null: false
    t.string   "password",          limit: 16,                    null: false
    t.text     "client_id",         limit: 65535,                 null: false
    t.text     "nickname",          limit: 65535,                 null: false
    t.text     "icon_image_path",   limit: 65535,                 null: false
    t.text     "header_image_path", limit: 65535,                 null: false
    t.boolean  "delete_flag",                     default: false, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["login_id"], name: "login_id", using: :btree

  create_table "yamajis", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "mail",       limit: 255
    t.datetime "updated_at",             null: false
    t.datetime "created_at",             null: false
  end

end
