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

ActiveRecord::Schema.define(version: 20151005223057) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "parent_id"
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["parent_id"], name: "index_comments_on_parent_id"

  create_table "group_join_requirements", force: :cascade do |t|
    t.integer  "group_id",            null: false
    t.integer  "join_requirement_id", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "group_join_requirements", ["group_id", "join_requirement_id"], name: "group_join_requirements_index", unique: true

  create_table "groups", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["parent_id"], name: "index_groups_on_parent_id"

  create_table "join_requirements", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposal_comments", force: :cascade do |t|
    t.integer  "proposal_id", null: false
    t.integer  "comment_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "proposal_comments", ["proposal_id", "comment_id"], name: "index_proposal_comments_on_proposal_id_and_comment_id", unique: true

  create_table "proposals", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "parent_id"
    t.integer  "thread_id",  null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "proposals", ["parent_id"], name: "index_proposals_on_parent_id"
  add_index "proposals", ["user_id", "parent_id", "thread_id"], name: "index_proposals_on_user_id_and_parent_id_and_thread_id", unique: true

  create_table "references", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "proposal_id", null: false
    t.string   "title",       null: false
    t.string   "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "references", ["user_id", "proposal_id"], name: "index_references_on_user_id_and_proposal_id", unique: true

  create_table "requirement_values", force: :cascade do |t|
    t.integer  "user_id",             null: false
    t.integer  "join_requirement_id", null: false
    t.string   "value",               null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "requirement_values", ["user_id", "join_requirement_id"], name: "index_requirement_values_on_user_id_and_join_requirement_id", unique: true

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["user_id", "group_id"], name: "index_subscriptions_on_user_id_and_group_id", unique: true

  create_table "tag_threads", force: :cascade do |t|
    t.integer  "thread_id",  null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tag_threads", ["thread_id", "tag_id"], name: "index_tag_threads_on_thread_id_and_tag_id", unique: true

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thread_comments", force: :cascade do |t|
    t.integer  "thread_id",  null: false
    t.integer  "comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "thread_comments", ["thread_id", "comment_id"], name: "index_thread_comments_on_thread_id_and_comment_id", unique: true

  create_table "threads", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "parent_id"
    t.integer  "group_id",   null: false
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "threads", ["parent_id"], name: "index_threads_on_parent_id"
  add_index "threads", ["user_id", "parent_id", "group_id"], name: "index_threads_on_user_id_and_parent_id_and_group_id", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "username",                       null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "users", ["username"], name: "index_users_on_username"

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "proposal_id", null: false
    t.integer  "opinion",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "votes", ["user_id", "proposal_id"], name: "index_votes_on_user_id_and_proposal_id", unique: true

end
