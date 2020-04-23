class CreateWpacSections < ActiveRecord::Migration[5.2]
  def change
    create_table :wpac_sections do |t|
      t.string :title
      t.string :subtitle
      t.string :cover_image
      t.string :cover_video
      t.integer :cover_filter_opacity
      t.integer :cover_type
      t.string :meta_title
      t.text :meta_description
      t.string :meta_image
      t.text :intro_paragraph
      t.text :long_paragraph
      t.text :wpac_outro
      t.string :support_banner_title
      t.text :support_banner_text
      t.string :support_banner_cta
      t.boolean :support_banner_heart
      t.boolean :support_banner_link

      t.timestamps
    end
  end
end
