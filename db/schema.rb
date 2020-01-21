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

ActiveRecord::Schema.define(version: 2020_01_20_084316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "titolo"
    t.string "sottotitolo"
    t.date "data_inizio"
    t.date "data_fine"
    t.string "orario"
    t.string "prezzo"
    t.text "descrizione"
    t.string "immagine"
    t.string "categoria"
    t.string "luogo"
    t.string "durata"
    t.string "posti"
    t.string "target"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "featured", default: false
    t.boolean "published", default: false
  end

  create_table "members", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.string "email"
    t.string "password"
    t.string "indirizzo"
    t.date "data_di_nascita"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
