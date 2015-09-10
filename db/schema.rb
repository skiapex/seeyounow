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

ActiveRecord::Schema.define(version: 20150901195629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_givers", force: true do |t|
    t.integer "patient_id"
    t.integer "inputter_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "phone_number"
    t.text    "other_information"
  end

  add_index "care_givers", ["inputter_id"], name: "index_care_givers_on_inputter_id", using: :btree
  add_index "care_givers", ["patient_id"], name: "index_care_givers_on_patient_id", using: :btree

  create_table "care_group_assignments", force: true do |t|
    t.integer  "clinician_id"
    t.integer  "patient_id"
    t.datetime "created_at"
  end

  add_index "care_group_assignments", ["clinician_id"], name: "index_care_group_assignments_on_clinician_id", using: :btree
  add_index "care_group_assignments", ["patient_id"], name: "index_care_group_assignments_on_patient_id", using: :btree

  create_table "care_groups", force: true do |t|
    t.string "name"
    t.string "province"
    t.string "city"
    t.text   "emergency_message"
  end

  create_table "clinicians", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "occupation_id"
    t.integer "gender_id"
    t.string  "office_number"
    t.string  "mobile_number"
    t.integer "care_group_id"
    t.integer "user_id"
    t.boolean "administrator", default: false
    t.integer "speciality_id"
  end

  add_index "clinicians", ["care_group_id"], name: "index_clinicians_on_care_group_id", using: :btree
  add_index "clinicians", ["gender_id"], name: "index_clinicians_on_gender_id", using: :btree
  add_index "clinicians", ["occupation_id"], name: "index_clinicians_on_occupation_id", using: :btree
  add_index "clinicians", ["speciality_id"], name: "index_clinicians_on_speciality_id", using: :btree
  add_index "clinicians", ["user_id"], name: "index_clinicians_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "patient_id"
    t.integer  "clinician_id"
    t.integer  "from"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "general_comment"
  end

  add_index "comments", ["clinician_id"], name: "index_comments_on_clinician_id", using: :btree
  add_index "comments", ["patient_id"], name: "index_comments_on_patient_id", using: :btree

  create_table "esas_assessments", force: true do |t|
    t.integer  "patient_id"
    t.integer  "clinician_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pain"
    t.string   "pain_comment"
    t.integer  "tiredness"
    t.string   "tiredness_comment"
    t.integer  "drowsiness"
    t.string   "drowsiness_comment"
    t.integer  "nausea"
    t.string   "nausea_comment"
    t.integer  "lack_of_appetite"
    t.string   "lack_of_appetite_comment"
    t.integer  "shortness_of_breath"
    t.string   "shortness_of_breath_comment"
    t.integer  "depression"
    t.string   "depression_comment"
    t.integer  "wellbeing"
    t.string   "wellbeing_comment"
    t.integer  "other_symptom_id"
    t.integer  "other_symptom_score"
    t.string   "other_symptom_comment"
    t.string   "esas_comment"
    t.string   "resolution"
    t.boolean  "priority_resolved",           default: false
    t.integer  "anxiety"
    t.string   "anxiety_comment"
    t.integer  "resolved_by"
    t.integer  "care_giver_id"
    t.boolean  "clinician_completed",         default: false
  end

  add_index "esas_assessments", ["care_giver_id"], name: "index_esas_assessments_on_care_giver_id", using: :btree
  add_index "esas_assessments", ["clinician_id"], name: "index_esas_assessments_on_clinician_id", using: :btree
  add_index "esas_assessments", ["other_symptom_id"], name: "index_esas_assessments_on_other_symptom_id", using: :btree
  add_index "esas_assessments", ["patient_id"], name: "index_esas_assessments_on_patient_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.datetime "created_at"
    t.text     "feedback_comment"
    t.string   "full_name"
  end

  create_table "genders", force: true do |t|
    t.string "gender_type"
  end

  create_table "inputters", force: true do |t|
    t.string "inputter_type"
  end

  create_table "notes", force: true do |t|
    t.integer  "patient_id"
    t.integer  "clinician_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "care_note"
  end

  add_index "notes", ["clinician_id"], name: "index_notes_on_clinician_id", using: :btree
  add_index "notes", ["patient_id"], name: "index_notes_on_patient_id", using: :btree

  create_table "notification_settings", force: true do |t|
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

  add_index "notification_settings", ["clinician_id"], name: "index_notification_settings_on_clinician_id", using: :btree

  create_table "occupations", force: true do |t|
    t.string "name"
    t.string "acronym"
    t.string "pronym"
  end

  create_table "other_symptoms", force: true do |t|
    t.string "symptom_type"
  end

  create_table "patients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.string   "diagnosis"
    t.integer  "gender_id"
    t.string   "address"
    t.string   "phone_number"
    t.text     "goals_of_care"
    t.boolean  "patient_deceased",   default: false
    t.boolean  "patient_archived",   default: false
    t.integer  "other_symptom"
    t.datetime "diagnosis_date"
    t.text     "important_to_you"
    t.integer  "care_group_id"
    t.datetime "birth_date"
    t.integer  "notification_level"
    t.boolean  "data_viewable",      default: false
  end

  add_index "patients", ["care_group_id"], name: "index_patients_on_care_group_id", using: :btree
  add_index "patients", ["gender_id"], name: "index_patients_on_gender_id", using: :btree
  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "prfs_assessments", force: true do |t|
    t.integer  "patient_id"
    t.integer  "clinician_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prfs_comment"
    t.integer  "activity_and_function"
    t.integer  "care_giver_id"
    t.boolean  "clinician_completed",   default: false
  end

  add_index "prfs_assessments", ["care_giver_id"], name: "index_prfs_assessments_on_care_giver_id", using: :btree
  add_index "prfs_assessments", ["clinician_id"], name: "index_prfs_assessments_on_clinician_id", using: :btree
  add_index "prfs_assessments", ["patient_id"], name: "index_prfs_assessments_on_patient_id", using: :btree

  create_table "specialities", force: true do |t|
    t.string  "name"
    t.integer "occupation_id"
  end

  add_index "specialities", ["occupation_id"], name: "index_specialities_on_occupation_id", using: :btree

  create_table "users", force: true do |t|
    t.string  "email"
    t.string  "password_digest"
    t.string  "timezone"
    t.integer "patient_id"
    t.integer "clinician_id"
    t.boolean "terms_agreement", default: false
  end

  add_index "users", ["clinician_id"], name: "index_users_on_clinician_id", using: :btree
  add_index "users", ["patient_id"], name: "index_users_on_patient_id", using: :btree

end
