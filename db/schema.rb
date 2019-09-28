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

ActiveRecord::Schema.define(version: 2019_09_27_125121) do

  create_table "greats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "great_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["great_id"], name: "index_greats_on_great_id"
    t.index ["user_id", "great_id"], name: "index_greats_on_user_id_and_great_id", unique: true
    t.index ["user_id"], name: "index_greats_on_user_id"
  end

  create_table "interviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "answer_1"
    t.text "answer_2"
    t.text "answer_3"
    t.text "answer_4"
    t.text "answer_5"
    t.text "answer_6"
    t.text "answer_7"
    t.text "answer_8"
    t.text "answer_9"
    t.text "gakki"
    t.text "item"
    t.text "photo"
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "age"
    t.string "gender"
    t.string "area"
    t.string "part"
    t.string "category"
    t.string "twitter"
    t.string "facebook"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "instagram"
    t.string "comment"
    t.bigint "prefecture_id"
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id"
  end

  add_foreign_key "greats", "users"
  add_foreign_key "greats", "users", column: "great_id"
  add_foreign_key "interviews", "users"
end
