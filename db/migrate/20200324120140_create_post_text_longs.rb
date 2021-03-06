class CreatePostTextLongs < ActiveRecord::Migration[5.2]
  def change
    create_table :post_text_longs do |t|
      t.text :content
      t.boolean :visible
      t.references :blog_post_section, foreign_key: true

      t.timestamps
    end
  end
end
