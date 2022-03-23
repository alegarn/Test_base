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

ActiveRecord::Schema.define(version: 2022_03_23_090641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_finances", force: :cascade do |t|
    t.integer "answer_1"
    t.integer "answer_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_finance_id"
    t.index ["category_finance_id"], name: "index_answer_finances_on_category_finance_id"
  end

  create_table "answer_humen", force: :cascade do |t|
    t.integer "answer_1"
    t.integer "answer_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_humen_id"
    t.index ["category_humen_id"], name: "index_answer_humen_on_category_humen_id"
  end

  create_table "category_finances", force: :cascade do |t|
    t.integer "total_notation_finance"
    t.integer "max_notation_finance"
    t.integer "total_100_finance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "score_id"
    t.index ["score_id"], name: "index_category_finances_on_score_id"
  end

  create_table "category_humen", force: :cascade do |t|
    t.integer "total_notation_human"
    t.integer "max_notation_human"
    t.integer "total_100_human"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "score_id"
    t.index ["score_id"], name: "index_category_humen_on_score_id"
  end

  create_table "scores", force: :cascade do |t|
    t.string "name"
    t.integer "total"
    t.integer "total_max"
    t.integer "total_100"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "startup_id"
    t.index ["startup_id"], name: "index_scores_on_startup_id"
  end

  create_table "startups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_startups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answer_finances", "category_finances"
  add_foreign_key "answer_humen", "category_humen", column: "category_humen_id"
  add_foreign_key "category_finances", "scores"
  add_foreign_key "category_humen", "scores"
  add_foreign_key "scores", "startups"
  add_foreign_key "startups", "users"
end
