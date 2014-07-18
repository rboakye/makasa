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

ActiveRecord::Schema.define(version: 20140614001609) do

  create_table "audio_pieces", force: true do |t|
    t.string   "category"
    t.string   "audio_uuid",         null: false
    t.integer  "user_id",            null: false
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audio_pieces", ["audio_uuid"], name: "index_audio_pieces_on_audio_uuid", using: :btree
  add_index "audio_pieces", ["user_id"], name: "index_audio_pieces_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "kasa_comment",     null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.string   "user_uuid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "communities", force: true do |t|
    t.string   "owner",        null: false
    t.string   "member_uuid",  null: false
    t.boolean  "family"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.text     "image_description"
    t.string   "creator"
    t.string   "image_uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "message_type"
    t.integer  "user_id",         null: false
    t.string   "sender_uuid",     null: false
    t.string   "transaction_id",  null: false
    t.text     "message_content", null: false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "post_by",                      null: false
    t.text     "post_content",                 null: false
    t.boolean  "is_private",   default: false, null: false
    t.string   "post_uuid",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_connected", default: false
    t.integer  "connected_id"
  end

  create_table "timelines", force: true do |t|
    t.integer  "momentable_id",                  null: false
    t.string   "momentable_type",                null: false
    t.integer  "user_id",                        null: false
    t.boolean  "is_public",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timelines", ["momentable_id", "momentable_type"], name: "index_timelines_on_momentable_id_and_momentable_type", using: :btree
  add_index "timelines", ["user_id"], name: "index_timelines_on_user_id", using: :btree

  create_table "user_communities", force: true do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_communities", ["user_id", "community_id"], name: "index_user_communities_on_user_id_and_community_id", using: :btree

  create_table "user_images", force: true do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_images", ["user_id", "image_id"], name: "index_user_images_on_user_id_and_image_id", using: :btree

  create_table "user_posts", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_posts", ["user_id", "post_id"], name: "index_user_posts_on_user_id_and_post_id", using: :btree

  create_table "user_sessions", force: true do |t|
    t.boolean  "is_online",  default: false
    t.datetime "last_seen"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sessions", ["user_id"], name: "index_user_sessions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",          null: false
    t.string   "last_name",           null: false
    t.string   "email",               null: false
    t.string   "user_uuid",           null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "current_city"
    t.string   "phone"
    t.string   "gender"
    t.text     "about_me"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "birth_date"
    t.string   "user_name"
  end

end
