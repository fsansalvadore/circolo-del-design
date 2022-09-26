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

ActiveRecord::Schema.define(version: 2022_09_26_145223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_pages", force: :cascade do |t|
    t.string "page_label"
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_image"
    t.string "heading"
    t.text "subheading"
    t.string "bg_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "image_set"
    t.integer "audio_provider"
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
    t.string "subtitle"
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
    t.string "project_title"
    t.string "project_studio"
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

  create_table "card_categories", force: :cascade do |t|
    t.string "title"
    t.string "primary_color"
    t.string "secondary_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carousels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "position"
    t.boolean "published"
    t.boolean "is_published"
    t.date "published_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collaborators", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.string "image"
    t.integer "position"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "contacts_pages", force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_image"
    t.string "page_label"
    t.string "heading"
    t.text "subheading"
    t.string "form_title"
    t.text "form_subtitle"
    t.text "address_left"
    t.string "address_title"
    t.string "address_subtitle"
    t.string "map_image"
    t.text "map_box_text"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "content_blocks", force: :cascade do |t|
    t.string "contentable_type", null: false
    t.bigint "contentable_id", null: false
    t.string "title"
    t.integer "kind", default: 0
    t.text "rich_text"
    t.string "image"
    t.string "image_description"
    t.string "image_width"
    t.integer "video_provider"
    t.string "video_link"
    t.string "video_description"
    t.string "instagram_link"
    t.string "twitter_link"
    t.integer "audio_provider"
    t.string "soundcloud_link"
    t.string "link_url"
    t.string "link_label"
    t.string "link_target"
    t.integer "link_style", default: 0
    t.boolean "is_visible", default: true
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "form_action"
    t.text "richtext_secondary"
    t.string "carousel_id"
    t.index ["contentable_type", "contentable_id"], name: "index_content_blocks_on_contentable_type_and_contentable_id"
  end

  create_table "cultural_projects", force: :cascade do |t|
    t.string "title"
    t.integer "intro_media_type"
    t.string "intro_image"
    t.string "intro_video"
    t.string "intro_video_provider"
    t.text "content"
    t.string "link_cta"
    t.string "link_url"
    t.date "start_date"
    t.string "end_date"
    t.string "cover"
    t.string "meta_title"
    t.string "meta_keywords"
    t.string "meta_description"
    t.integer "intro_media_select"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "show_in_nav"
    t.boolean "featured"
    t.index ["slug"], name: "index_cultural_projects_on_slug", unique: true
  end

  create_table "cultural_projects_pages", force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_image"
    t.string "page_label"
    t.string "heading"
    t.text "subheading"
    t.string "bg_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_blocks", force: :cascade do |t|
    t.string "title"
    t.boolean "visible", default: true
    t.text "rich_text"
    t.string "image_url"
    t.string "image_description"
    t.string "image_width"
    t.integer "video_provider", default: 0
    t.string "video_link"
    t.string "video_description"
    t.string "instagram_link"
    t.string "twitter_link"
    t.string "soundcloud_link"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.integer "link_style", default: 0
    t.string "link_url"
    t.string "link_label"
    t.string "link_target", default: "_self"
    t.string "link_color"
    t.index ["event_id"], name: "index_event_blocks_on_event_id"
  end

  create_table "event_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "preview_link_url"
    t.boolean "preview_link_presence"
    t.boolean "preview_link_target"
    t.boolean "is_not_in_calendar", default: false
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

  create_table "global_settings", force: :cascade do |t|
    t.string "site_title"
    t.string "favicon"
    t.string "facebook_url"
    t.string "youtube_url"
    t.string "instagram_url"
    t.string "linkedin_url"
    t.string "meta_image"
    t.string "meta_description"
    t.string "main_email"
    t.string "main_tel"
    t.string "opening_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "title"
    t.string "meta_title"
    t.string "meta_keywords"
  end

  create_table "home_page_cards", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "image"
    t.string "image_alt"
    t.date "start_date"
    t.date "end_date"
    t.string "link"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "page_home_id"
    t.integer "content_category", default: 0
    t.string "eventy_type_category"
    t.boolean "link_target"
    t.boolean "is_draft", default: false
    t.index ["page_home_id"], name: "index_home_page_cards_on_page_home_id"
  end

  create_table "home_page_column_one_links", force: :cascade do |t|
    t.string "link"
    t.string "label"
    t.boolean "target"
    t.integer "link_style"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "page_home_id"
    t.index ["page_home_id"], name: "index_home_page_column_one_links_on_page_home_id"
  end

  create_table "home_page_column_three_links", force: :cascade do |t|
    t.string "link"
    t.string "label"
    t.boolean "target"
    t.integer "link_style"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "page_home_id"
    t.index ["page_home_id"], name: "index_home_page_column_three_links_on_page_home_id"
  end

  create_table "home_page_column_two_links", force: :cascade do |t|
    t.string "link"
    t.string "label"
    t.boolean "target"
    t.integer "link_style"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "page_home_id"
    t.index ["page_home_id"], name: "index_home_page_column_two_links_on_page_home_id"
  end

  create_table "home_page_links", force: :cascade do |t|
    t.string "url"
    t.string "label"
    t.boolean "target"
    t.integer "link_style"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "page_home_id"
    t.index ["page_home_id"], name: "index_home_page_links_on_page_home_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.string "src"
    t.string "alt"
    t.text "label"
    t.integer "position"
    t.json "preferences"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "links", force: :cascade do |t|
    t.string "link"
    t.string "label"
    t.integer "link_style"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "target"
  end

  create_table "memberships_pages", force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_image"
    t.string "page_label"
    t.string "heading"
    t.text "subheading"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletter_pages", force: :cascade do |t|
    t.string "heading"
    t.text "subheading"
    t.string "form_action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_homes", force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_image"
    t.boolean "splash_presence"
    t.integer "splash_delay"
    t.integer "splash_duration"
    t.string "splash_title"
    t.string "splash_bg_img"
    t.string "title"
    t.text "subtitle"
    t.boolean "carousel_presence"
    t.text "paragraph_1"
    t.boolean "arrow_presence"
    t.string "arrow_icon"
    t.boolean "cta_section_presence"
    t.string "cta_section_link_text"
    t.string "cta_section_link_url"
    t.boolean "newsletter_box_presence"
    t.text "newsletter_box_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "paragraph_2"
    t.string "cta_section_title"
    t.string "heading"
    t.text "subheading"
    t.string "content_img"
    t.string "splash_content_img"
    t.string "hero_image"
    t.integer "hero_color_mode"
    t.string "hero_marquee_words"
    t.boolean "hero_marquee_presence"
    t.boolean "social_presence"
    t.boolean "banner_presence"
    t.string "banner_img_desktop"
    t.string "banner_img_mobile"
    t.string "banner_link"
    t.boolean "banner_target"
    t.string "splash_content_img_mobile"
    t.string "splash_bg_img_mobile"
    t.string "column_1_title"
    t.string "column_2_title"
    t.string "column_3_title"
    t.boolean "info_section_presence"
    t.boolean "info_section_schedule_presence"
    t.boolean "info_section_address_presence"
    t.string "box_link_1_image"
    t.string "box_link_1_url"
    t.boolean "box_link_1_target"
    t.boolean "box_link_1_presence"
    t.string "box_link_2_image"
    t.string "box_link_2_url"
    t.boolean "box_link_2_target"
    t.boolean "box_link_2_presence"
    t.string "box_link_3_image"
    t.string "box_link_3_url"
    t.boolean "box_link_3_target"
    t.boolean "box_link_3_presence"
    t.boolean "modal_presence", default: false
    t.string "modal_image"
    t.string "modal_link"
  end

  create_table "page_meta_data", force: :cascade do |t|
    t.string "metadatable_type", null: false
    t.bigint "metadatable_id", null: false
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.string "meta_image"
    t.string "favicon"
    t.boolean "isPublished"
    t.datetime "publishedAt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metadatable_type", "metadatable_id"], name: "index_page_meta_data_on_metadatable_type_and_metadatable_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title", null: false
    t.string "abstract"
    t.string "slug"
    t.integer "lang", default: 0
    t.string "cover"
    t.integer "priority", default: 5
    t.datetime "published_at"
    t.boolean "is_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "services_pages", force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_image"
    t.string "page_label"
    t.string "heading"
    t.text "subheading"
    t.string "bg_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_project_blocks", force: :cascade do |t|
    t.string "title"
    t.boolean "visible", default: true
    t.text "rich_text"
    t.string "image_url"
    t.string "image_description"
    t.string "image_width"
    t.integer "video_provider", default: 0
    t.string "video_link"
    t.string "video_description"
    t.string "instagram_link"
    t.string "twitter_link"
    t.string "soundcloud_link"
    t.integer "position"
    t.bigint "special_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_url"
    t.index ["special_project_id"], name: "index_special_project_blocks_on_special_project_id"
  end

  create_table "special_projects", force: :cascade do |t|
    t.string "title"
    t.boolean "intro_media_type"
    t.string "intro_image"
    t.string "intro_video"
    t.string "intro_video_provider"
    t.text "content"
    t.string "link_cta"
    t.string "link_url"
    t.date "year"
    t.string "cover"
    t.string "meta_keywords"
    t.string "meta_title"
    t.string "meta_description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published"
    t.integer "intro_media_select"
    t.boolean "show_in_nav"
    t.boolean "featured"
  end

  create_table "special_projects_pages", force: :cascade do |t|
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.string "meta_image"
    t.string "page_label"
    t.string "heading"
    t.text "subheading"
    t.string "bg_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "wpac_sections", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "cover_image"
    t.string "cover_video"
    t.integer "cover_filter_opacity"
    t.integer "cover_type"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image"
    t.text "intro_paragraph"
    t.text "long_paragraph"
    t.text "wpac_outro"
    t.string "support_banner_title"
    t.text "support_banner_text"
    t.string "support_banner_cta"
    t.boolean "support_banner_heart"
    t.string "support_banner_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_video_poster"
    t.boolean "preview_visibility"
    t.string "preview_img"
    t.string "preview_title"
    t.text "preview_subtitle"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_sections", "articles"
  add_foreign_key "blog_post_images", "blog_post_sections"
  add_foreign_key "blog_post_images", "blog_posts"
  add_foreign_key "blog_post_sections", "blog_posts"
  add_foreign_key "blog_post_videos", "blog_post_sections"
  add_foreign_key "blog_post_videos", "blog_posts"
  add_foreign_key "event_blocks", "events"
  add_foreign_key "home_page_cards", "page_homes"
  add_foreign_key "home_page_column_one_links", "page_homes"
  add_foreign_key "home_page_column_three_links", "page_homes"
  add_foreign_key "home_page_column_two_links", "page_homes"
  add_foreign_key "home_page_links", "page_homes"
  add_foreign_key "post_instagrams", "blog_post_sections"
  add_foreign_key "post_instagrams", "blog_posts"
  add_foreign_key "post_text_longs", "blog_post_sections"
  add_foreign_key "post_text_longs", "blog_posts"
  add_foreign_key "post_text_shorts", "blog_post_sections"
  add_foreign_key "post_text_shorts", "blog_posts"
  add_foreign_key "special_project_blocks", "special_projects"
  add_foreign_key "taggings", "tags"
end
