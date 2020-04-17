class CreateArticleSections < ActiveRecord::Migration[5.2]
  def change
    create_table :article_sections do |t|
      t.string :title
      t.boolean :visible
      t.text :rich_text
      t.text :rich_text_small
      t.string :image
      t.string :image_description
      t.string :image_width
      t.integer :video_provider, default: 0
      t.string :video_link
      t.string :video_description
      t.string :instagram_link
      t.string :twitter_link
      t.string :soundcloud_link
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
