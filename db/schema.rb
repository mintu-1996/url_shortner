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

ActiveRecord::Schema.define(version: 2019_06_15_053830) do

  create_table "emp", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id"
    t.integer "amt"
  end

  create_table "empdet", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id"
    t.integer "age"
    t.string "name"
  end

  create_table "patient_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "patient_id"
    t.datetime "admitted_at"
    t.datetime "discharged_at"
    t.decimal "amount_spent", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_records_on_patient_id"
  end

  create_table "patients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.string "phone"
    t.string "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "urls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "original_url"
    t.string "short_url"
    t.string "sanitized_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_patients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_user_patients_on_patient_id"
    t.index ["user_id"], name: "index_user_patients_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_id"
    t.string "phone"
    t.string "password_digest"
    t.string "login_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
