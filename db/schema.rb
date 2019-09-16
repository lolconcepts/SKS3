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

ActiveRecord::Schema.define(version: 2014_01_07_191406) do

  create_table "attendances", force: :cascade do |t|
    t.integer "student_id"
    t.string "dow"
    t.date "classdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "class_slips", force: :cascade do |t|
    t.string "dayofweek"
    t.time "timeofday"
    t.string "agegroup"
    t.string "rankgroup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dojos", force: :cascade do |t|
    t.string "name"
    t.string "motto"
    t.string "telephone"
    t.string "website"
    t.string "email"
    t.string "pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "twitter"
    t.string "facebook"
    t.string "youtube"
    t.integer "count", default: 0
    t.integer "max", default: 100
  end

  create_table "ranks", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "base"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.integer "rank_id"
    t.integer "years_in_martial_arts"
    t.string "instructors"
    t.integer "classes_attended_each_week"
    t.boolean "blackbelt_club"
    t.boolean "swat"
    t.boolean "storm"
    t.boolean "demo_team"
    t.boolean "tournament_team"
    t.string "school"
    t.string "favorite_martial_artist"
    t.string "favorite_movie"
    t.string "favorite_class_activity"
    t.string "short_term_goal"
    t.string "long_term_goal"
    t.integer "tnetid"
    t.boolean "tnet_member"
    t.string "pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cardiokick"
    t.boolean "mastersclub"
    t.boolean "instructor"
    t.date "dob"
    t.date "startdate"
    t.integer "stripe"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "email"
    t.string "telephone"
    t.index ["rank_id"], name: "index_students_on_rank_id"
  end

  create_table "welcomes", force: :cascade do |t|
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
