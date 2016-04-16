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

ActiveRecord::Schema.define(version: 20160416082008) do

  create_table "categories", force: :cascade do |t|
    t.string   "upload_picture_file_name"
    t.string   "upload_picture_content_type"
    t.integer  "upload_picture_file_size"
    t.datetime "upload_picture_updated_at"
    t.string   "category"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "from_ip"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.integer  "posting_id"
    t.integer  "info_id"
    t.string   "image_comment_file_name"
    t.string   "image_comment_content_type"
    t.integer  "image_comment_file_size"
    t.datetime "image_comment_updated_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "played"
    t.string   "language"
    t.string   "rating"
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.string   "down_file_file_name"
    t.string   "down_file_content_type"
    t.integer  "down_file_file_size"
    t.datetime "down_file_updated_at"
    t.string   "category"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "flashes", force: :cascade do |t|
    t.integer  "film_id"
    t.string   "down_file_file_name"
    t.string   "down_file_content_type"
    t.integer  "down_file_file_size"
    t.datetime "down_file_updated_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "infos", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.integer  "user_id"
    t.string   "telephone"
    t.string   "data"
    t.string   "bio"
    t.boolean  "send_new_film",         default: false
    t.boolean  "send_comments_to_film", default: false
    t.boolean  "ban",                   default: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "infos", ["user_id"], name: "index_infos_on_user_id"

  create_table "pictures", force: :cascade do |t|
    t.string   "picture"
    t.string   "flash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "year"
    t.string   "actor"
    t.string   "language"
    t.boolean  "subtitle"
    t.string   "title"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "role"
    t.string   "admin",                  default: "f"
    t.string   "boolean",                default: "f"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "voices", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.integer  "sum_voices",   default: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
