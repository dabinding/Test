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

ActiveRecord::Schema.define(version: 20151213005254) do

  create_table "admins", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "department_forms", force: true do |t|
    t.string   "change_employer"
    t.string   "student_name"
    t.string   "gender"
    t.string   "student_id"
    t.string   "ucm_gpa"
    t.string   "student_address"
    t.string   "phone_number"
    t.string   "email_address"
    t.integer  "credit_hours_when_conducted",        limit: 4
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_contact"
    t.string   "company_phone_number"
    t.string   "company_everify_number"
    t.string   "company_duration_from"
    t.string   "company_duration_to"
    t.string   "internship_position"
    t.text     "job_responsibility"
    t.string   "hourly_salary"
    t.string   "weekly_hours"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "unofficial_transcript_file_name"
    t.string   "unofficial_transcript_content_type"
    t.integer  "unofficial_transcript_file_size"
    t.datetime "unofficial_transcript_updated_at"
  end

end
