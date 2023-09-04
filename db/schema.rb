
ActiveRecord::Schema[7.0].define(version: 2023_09_04_085152) do
  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.text "phone_number"
    t.string "email"
    t.string "messenger"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.string "comments"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.string "place"
    t.date "date"
    t.time "start_time"
    t.index ["client_id"], name: "index_jobs_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "jobs", "clients"
end
