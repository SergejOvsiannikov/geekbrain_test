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

ActiveRecord::Schema.define(version: 20200714073403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "course_id",                  null: false
    t.datetime "start_date"
    t.integer  "students_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["course_id"], name: "index_groups_on_course_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true, using: :btree
  end

  create_table "students_groups", force: :cascade do |t|
    t.integer  "student_id", null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_students_groups_on_group_id", using: :btree
    t.index ["student_id", "group_id"], name: "index_students_groups_on_student_id_and_group_id", unique: true, using: :btree
    t.index ["student_id"], name: "index_students_groups_on_student_id", using: :btree
  end

  add_foreign_key "groups", "courses"
  add_foreign_key "students_groups", "groups"
  add_foreign_key "students_groups", "students"
end
