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

ActiveRecord::Schema.define(version: 20171022225903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_details", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "project_id", null: false
    t.integer "spent_time", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_details_on_post_id"
    t.index ["project_id"], name: "index_post_details_on_project_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "published_at", null: false
    t.text "unknown_content"
    t.text "impression_content"
    t.integer "status", default: 0, null: false
    t.integer "stars_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "client_name", null: false
    t.string "project_name", null: false
    t.integer "status", default: 0, null: false
    t.text "description"
    t.integer "scheduled_time"
    t.integer "actual_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "stars", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "user_id"], name: "index_stars_on_post_id_and_user_id", unique: true
    t.index ["post_id"], name: "index_stars_on_post_id"
    t.index ["user_id"], name: "index_stars_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_teams_on_access_token", unique: true
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "post_details", "posts"
  add_foreign_key "post_details", "projects"
  add_foreign_key "posts", "users"
  add_foreign_key "projects", "teams"
  add_foreign_key "stars", "posts"
  add_foreign_key "stars", "users"
  add_foreign_key "users", "teams"
end
