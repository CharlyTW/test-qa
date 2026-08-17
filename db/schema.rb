# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_17_141129) do
  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "display_name"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "slug"
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_accounts_on_slug", unique: true
  end

  create_table "conversation_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "archived_at"
    t.integer "conversation_id", null: false
    t.datetime "created_at", null: false
    t.integer "unread", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_conversation_accounts_on_account_id"
    t.index ["conversation_id", "account_id"], name: "index_conversation_accounts_on_conversation_id_and_account_id", unique: true
    t.index ["conversation_id"], name: "index_conversation_accounts_on_conversation_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer "account_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_listings_on_account_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.integer "conversation_id", null: false
    t.datetime "created_at", null: false
    t.integer "sender_id", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  add_foreign_key "conversation_accounts", "accounts"
  add_foreign_key "conversation_accounts", "conversations"
  add_foreign_key "listings", "accounts"
  add_foreign_key "messages", "accounts", column: "sender_id"
  add_foreign_key "messages", "conversations"
end
