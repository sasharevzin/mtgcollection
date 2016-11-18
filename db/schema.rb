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

ActiveRecord::Schema.define(version: 20161118005054) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "multiverse_id"
    t.string   "manaCost"
    t.string   "colors"
    t.string   "colorIdentity"
    t.integer  "cmc"
    t.string   "cardtype"
    t.string   "cardtypes"
    t.string   "cardsubtypes"
    t.string   "rarity"
    t.string   "set"
    t.string   "setName"
    t.text     "text"
    t.string   "flavor"
    t.string   "artist"
    t.string   "number"
    t.string   "power"
    t.string   "toughness"
    t.string   "layout"
    t.text     "image_url",     default: "www.google.com"
    t.string   "watermark"
    t.string   "rulings"
    t.string   "printings"
    t.text     "original_text"
    t.string   "original_type"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",              default: false
    t.string   "activation_digest"
    t.boolean  "activated",          default: false
    t.datetime "activated_at"
    t.datetime "activation_sent_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
