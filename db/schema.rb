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

ActiveRecord::Schema.define(version: 2019_04_01_193802) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author_firstname"
    t.string "author_lastname"
    t.date "year"
    t.string "genre"
    t.integer "bookshelf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookshelf_id"], name: "index_books_on_bookshelf_id"
  end

  create_table "bookshelves", force: :cascade do |t|
    t.string "shelf_name"
    t.integer "count"
    t.integer "reader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reader_id"], name: "index_bookshelves_on_reader_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

end
