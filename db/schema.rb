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

ActiveRecord::Schema.define(version: 20140919014705) do

  create_table "program_permissions", force: true do |t|
    t.integer  "program_user_id"
    t.string   "resource"
    t.integer  "permission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "program_users", force: true do |t|
    t.integer  "program_id"
    t.integer  "user_id"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_assignment_submission_grades", force: true do |t|
    t.integer  "section_assignment_submission_id"
    t.integer  "user_id"
    t.string   "comments"
    t.string   "quality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_assignment_submissions", force: true do |t|
    t.integer  "section_assignment_id"
    t.integer  "user_id"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_assignments", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.integer  "week"
    t.string   "description"
    t.datetime "datetime_due"
    t.datetime "datetime_post_solutions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_permissions", force: true do |t|
    t.integer  "section_user_id"
    t.string   "resource"
    t.integer  "permission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_users", force: true do |t|
    t.integer  "section_id"
    t.integer  "user_id"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "program_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   default: 0
    t.string   "organization"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
