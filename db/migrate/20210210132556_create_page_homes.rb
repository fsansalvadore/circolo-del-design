class CreatePageHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :page_homes do |t|
      t.string  :meta_title
      t.string  :meta_description
      t.string  :meta_keywords
      t.string  :meta_image
      t.boolean :splash_presence
      t.integer :splash_delay
      t.integer :splash_duration
      t.string :splash_title
      t.string :splash_bg_img
      t.string :title
      t.text :subtitle
      t.boolean :carousel_presence
      t.text :paragraph_1
      t.boolean :arrow_presence
      t.string :arrow_icon
      t.boolean :cta_section_presence
      t.string :cta_section_link_text
      t.string :cta_section_link_url
      t.boolean :newsletter_box_presence
      t.text :newsletter_box_text

      t.timestamps
    end
  end
end
