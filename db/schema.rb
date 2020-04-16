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

ActiveRecord::Schema.define(version: 2020_04_16_142204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "article_sections", force: :cascade do |t|
    t.string "title"
    t.boolean "visible", default: true
    t.text "rich_text"
    t.text "rich_text_small"
    t.string "image"
    t.string "image_description"
    t.string "image_width"
    t.integer "video_provider", default: 0
    t.string "video_link"
    t.string "video_description"
    t.string "instagram_link"
    t.string "twitter_link"
    t.string "soundcloud_link"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["article_id"], name: "index_article_sections_on_article_id"
  end

  create_table "article_themes", force: :cascade do |t|
    t.string "nome"
    t.integer "priorità"
    t.integer "position"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "abstract"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "subtitle"
    t.string "cover"
    t.string "meta_keywords"
    t.string "meta_title"
    t.text "meta_description"
    t.string "media_type"
    t.string "translation_link"
    t.integer "lang", default: 1
    t.text "content"
    t.text "intro"
    t.datetime "publish_date"
    t.boolean "published", default: false
    t.integer "priority", default: 5
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "position"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "blog_categories", force: :cascade do |t|
    t.string "nome"
    t.integer "priorità"
    t.integer "position"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_post_images", force: :cascade do |t|
    t.string "image"
    t.text "description"
    t.string "width"
    t.bigint "blog_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blog_post_section_id"
    t.index ["blog_post_id"], name: "index_blog_post_images_on_blog_post_id"
    t.index ["blog_post_section_id"], name: "index_blog_post_images_on_blog_post_section_id"
  end

  create_table "blog_post_sections", force: :cascade do |t|
    t.text "rich_text"
    t.string "image"
    t.string "image_description"
    t.string "image_width"
    t.string "vimeo_link"
    t.string "vimeo_description"
    t.string "instagram_link"
    t.string "twitter_link"
    t.boolean "visible", default: true
    t.integer "position"
    t.bigint "blog_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section_title"
    t.string "rich_text_small"
    t.index ["blog_post_id"], name: "index_blog_post_sections_on_blog_post_id"
  end

  create_table "blog_post_videos", force: :cascade do |t|
    t.string "vimeo_id"
    t.text "description"
    t.bigint "blog_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blog_post_section_id"
    t.index ["blog_post_id"], name: "index_blog_post_videos_on_blog_post_id"
    t.index ["blog_post_section_id"], name: "index_blog_post_videos_on_blog_post_section_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "subtitle"
    t.string "cover"
    t.string "keywords"
    t.string "rubrica"
    t.text "content"
    t.datetime "publish_date"
    t.boolean "published", default: false
    t.integer "priority", default: 5
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "intro"
    t.string "title_integration"
    t.string "lang_link_eng"
    t.string "lang_link_ita"
    t.integer "lang", default: 1
    t.string "meta_title"
    t.string "meta_description"
    t.index ["slug"], name: "index_blog_posts_on_slug", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "titolo"
    t.string "sottotitolo"
    t.date "data_inizio"
    t.date "data_fine"
    t.string "orario"
    t.string "prezzo"
    t.string "immagine"
    t.string "categoria"
    t.string "luogo"
    t.string "durata"
    t.string "posti"
    t.string "target"
    t.string "link"
    t.boolean "published"
    t.boolean "featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descrizione"
    t.string "image"
    t.integer "priority", default: 5
    t.string "slug"
    t.string "sotto_categoria"
    t.string "curator"
    t.string "keywords"
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "faces", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.string "azienda"
    t.string "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published", default: true
    t.string "image"
    t.string "ruolo"
    t.string "slug"
    t.text "description"
    t.string "link"
    t.index ["slug"], name: "index_faces_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "post_instagrams", force: :cascade do |t|
    t.string "link"
    t.boolean "visible"
    t.bigint "blog_post_section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blog_post_id"
    t.index ["blog_post_id"], name: "index_post_instagrams_on_blog_post_id"
    t.index ["blog_post_section_id"], name: "index_post_instagrams_on_blog_post_section_id"
  end

  create_table "post_text_longs", force: :cascade do |t|
    t.text "content"
    t.boolean "visible"
    t.bigint "blog_post_section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blog_post_id"
    t.index ["blog_post_id"], name: "index_post_text_longs_on_blog_post_id"
    t.index ["blog_post_section_id"], name: "index_post_text_longs_on_blog_post_section_id"
  end

  create_table "post_text_shorts", force: :cascade do |t|
    t.text "content"
    t.boolean "visible"
    t.bigint "blog_post_section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blog_post_id"
    t.index ["blog_post_id"], name: "index_post_text_shorts_on_blog_post_id"
    t.index ["blog_post_section_id"], name: "index_post_text_shorts_on_blog_post_section_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "team_members", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.string "ruolo"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.boolean "published", default: false
    t.integer "position"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_sections", "articles"
  add_foreign_key "blog_post_images", "blog_post_sections"
  add_foreign_key "blog_post_images", "blog_posts"
  add_foreign_key "blog_post_sections", "blog_posts"
  add_foreign_key "blog_post_videos", "blog_post_sections"
  add_foreign_key "blog_post_videos", "blog_posts"
  add_foreign_key "post_instagrams", "blog_post_sections"
  add_foreign_key "post_instagrams", "blog_posts"
  add_foreign_key "post_text_longs", "blog_post_sections"
  add_foreign_key "post_text_longs", "blog_posts"
  add_foreign_key "post_text_shorts", "blog_post_sections"
  add_foreign_key "post_text_shorts", "blog_posts"
  add_foreign_key "taggings", "tags"
end
