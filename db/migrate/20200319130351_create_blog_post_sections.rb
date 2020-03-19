class CreateBlogPostSections < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_post_sections do |t|
      t.text :rich_text
      t.string :image
      t.string :image_description
      t.string :image_width
      t.string :vimeo_link
      t.string :vimeo_description
      t.string :instagram_link
      t.string :twitter_link
      t.boolean :visible
      t.integer :position
      t.references :blog_post, foreign_key: true

      t.timestamps
    end
  end
end
