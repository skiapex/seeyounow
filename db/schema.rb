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

ActiveRecord::Schema.define(version: 0) do

  create_table "care_groups", force: true do |t|
    t.string "name"
  end

  create_table "clinicians", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "occupation"
    t.integer "gender"
    t.string  "email"
    t.string  "password"
    t.string  "office_number"
    t.string  "mobile_number"
    t.string  "emergency_message"
    t.integer "care_group_id"
  end

  add_index "clinicians", ["care_group_id"], name: "index_clinicians_on_care_group_id"

  create_table "comments", force: true do |t|
    t.integer "patient_id"
    t.integer "clinician_id"
    t.integer "from"
    t.string  "time"
    t.string  "general_comment"
  end

  add_index "comments", ["clinician_id"], name: "index_comments_on_clinician_id"
  add_index "comments", ["patient_id"], name: "index_comments_on_patient_id"

  create_table "esas_assesments", force: true do |t|
    t.integer "patient_id"
    t.integer "clinician_id"
    t.string  "time"
    t.string  "inputter_name"
    t.integer "inputter_id"
    t.integer "pain"
    t.string  "pain_comment"
    t.integer "tiredness"
    t.string  "tiredness_comment"
    t.integer "drowsiness"
    t.string  "drowsiness_comment"
    t.integer "nausea"
    t.string  "nausea_comment"
    t.integer "lack_of_appetitie"
    t.string  "lack_of_appetitie_comment"
    t.integer "shortness_of_breath"
    t.string  "shortness_of_breath_comment"
    t.integer "depression"
    t.string  "depression_comment"
    t.integer "wellbeing"
    t.string  "wellbeing_comment"
    t.integer "other_sypmtom_id"
    t.integer "other_sypmtom_score"
    t.string  "other_sypmtom_comment"
    t.string  "esas_comment"
  end

  add_index "esas_assesments", ["clinician_id"], name: "index_esas_assesments_on_clinician_id"
  add_index "esas_assesments", ["inputter_id"], name: "index_esas_assesments_on_inputter_id"
  add_index "esas_assesments", ["other_sypmtom_id"], name: "index_esas_assesments_on_other_sypmtom_id"
  add_index "esas_assesments", ["patient_id"], name: "index_esas_assesments_on_patient_id"

  create_table "genders", force: true do |t|
    t.string "gender_type"
  end

  create_table "inputters", force: true do |t|
    t.string "inputter_type"
  end

  create_table "notifications", force: true do |t|
    t.integer "clinician_id"
    t.integer "esas_yellow_highest_symptom"
    t.integer "esas_yellow_increase_of"
    t.integer "esas_yellow_email"
    t.integer "esas_yellow_text"
    t.integer "esas_orange_highest_symptom"
    t.integer "esas_orange_increase_of"
    t.integer "esas_orange_email"
    t.integer "esas_orange_text"
    t.integer "esas_red_highest_symptom"
    t.integer "esas_red_increase_of"
    t.integer "esas_red_email"
    t.integer "esas_red_text"
    t.integer "prfs_yellow"
    t.integer "prfs_yellow_email"
    t.integer "prfs_yellow_text"
    t.integer "prfs_orange"
    t.integer "prfs_orange_email"
    t.integer "prfs_orange_text"
    t.integer "prfs_red"
    t.integer "prfs_red_email"
    t.integer "prfs_red_text"
  end

  add_index "notifications", ["clinician_id"], name: "index_notifications_on_clinician_id"

  create_table "other_sypmtoms", force: true do |t|
    t.string "sypmtom_type"
  end

  create_table "patients", force: true do |t|
    t.integer "clinician_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "username"
    t.string  "diagnosis"
    t.integer "gender"
    t.string  "age"
    t.string  "address"
    t.string  "email"
    t.string  "password"
    t.string  "phone_number"
    t.string  "caregiver_name"
    t.integer "other_sypmtom"
    t.text    "goals_of_care"
    t.integer "shared_with"
    t.boolean "patient_deceased", default: false
    t.boolean "patient_archived", default: false
  end

  add_index "patients", ["clinician_id"], name: "index_patients_on_clinician_id"

  create_table "prfs_assesments", force: true do |t|
    t.integer "patient_id"
    t.integer "clinician_id"
    t.string  "time"
    t.string  "inputter_name"
    t.integer "inputter_id"
    t.integer "activity_and_function"
    t.string  "prfs_comment"
  end

  add_index "prfs_assesments", ["clinician_id"], name: "index_prfs_assesments_on_clinician_id"
  add_index "prfs_assesments", ["inputter_id"], name: "index_prfs_assesments_on_inputter_id"
  add_index "prfs_assesments", ["patient_id"], name: "index_prfs_assesments_on_patient_id"

end
