ActiveRecord::Schema.define(version: 2019_10_16_013022) do

  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "feed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "feed_id"], name: "index_favorites_on_user_id_and_feed_id", unique: true
  end

  create_table "feeds", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feeds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "feeds", "users"
end
