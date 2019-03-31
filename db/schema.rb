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

ActiveRecord::Schema.define(version: 2019_03_31_032257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference"
    t.integer "number"
    t.string "name"
    t.string "abbreviation"
    t.integer "numeric_value"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "greek_title"
    t.string "transcription"
    t.string "description"
    t.string "author"
    t.index ["discarded_at"], name: "index_books_on_discarded_at"
  end

  create_table "chapters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_id"
    t.string "reference"
    t.integer "number"
    t.integer "numeric_value"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_chapters_on_discarded_at"
  end

  create_table "criteria", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference"
    t.string "name"
    t.string "description"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_criteria_on_discarded_at"
  end

  create_table "features", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference"
    t.string "name"
    t.string "description"
    t.uuid "text_id"
    t.string "text_type"
    t.datetime "discarded_at"
    t.uuid "criterion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["criterion_id"], name: "index_features_on_criterion_id"
    t.index ["discarded_at"], name: "index_features_on_discarded_at"
  end

  create_table "paragraphs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference"
    t.string "header"
    t.uuid "book_id"
    t.uuid "chapter_id"
    t.uuid "start_verse_id"
    t.uuid "end_verse_id"
    t.integer "numeric_value"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_paragraphs_on_discarded_at"
  end

  create_table "strongs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "strong_number"
    t.string "meaning"
    t.string "greek"
    t.string "translit"
    t.string "morphology"
    t.text "description"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "normalized_greek"
    t.index ["discarded_at"], name: "index_strongs_on_discarded_at"
    t.index ["greek"], name: "index_strongs_on_greek"
    t.index ["meaning"], name: "index_strongs_on_meaning"
    t.index ["strong_number"], name: "index_strongs_on_strong_number"
  end

  create_table "verses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_id"
    t.uuid "chapter_id"
    t.string "reference"
    t.integer "number"
    t.integer "numeric_value"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_verses_on_discarded_at"
  end

  create_table "words", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "reference"
    t.uuid "strong_id"
    t.uuid "book_id"
    t.uuid "chapter_id"
    t.uuid "verse_id"
    t.integer "testament_position"
    t.integer "book_position"
    t.integer "chapter_position"
    t.integer "verse_position"
    t.string "strong_number"
    t.string "editions"
    t.string "interlinear"
    t.string "formatted_greek"
    t.string "normalized_greek"
    t.string "morphology"
    t.string "lexical_form"
    t.string "meaning"
    t.string "sub_meaning"
    t.string "variants"
    t.integer "numeric_value"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "chapter_id", "verse_id"], name: "index_words_on_book_id_and_chapter_id_and_verse_id"
    t.index ["discarded_at"], name: "index_words_on_discarded_at"
    t.index ["meaning"], name: "index_words_on_meaning"
    t.index ["strong_id"], name: "index_words_on_strong_id"
    t.index ["strong_number"], name: "index_words_on_strong_number"
    t.index ["testament_position"], name: "index_words_on_testament_position"
  end

  add_foreign_key "features", "criteria", column: "criterion_id"
end
