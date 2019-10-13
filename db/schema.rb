# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_12_113215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", primary_key: "uid", id: :string, limit: 20, force: :cascade do |t|
    t.string "team_id", limit: 20, null: false
    t.string "name", null: false
    t.string "ans_q1", array: true
    t.string "ans_q2", array: true
    t.string "ans_q3", array: true
    t.string "ans_q4", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ans_q1"], name: "index_members_on_ans_q1", using: :gin
    t.index ["ans_q2"], name: "index_members_on_ans_q2", using: :gin
    t.index ["ans_q3"], name: "index_members_on_ans_q3", using: :gin
    t.index ["ans_q4"], name: "index_members_on_ans_q4", using: :gin
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["uid"], name: "index_members_on_uid", unique: true
  end

  create_table "teams", primary_key: "uid", id: :string, limit: 20, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_teams_on_uid", unique: true
  end

end
