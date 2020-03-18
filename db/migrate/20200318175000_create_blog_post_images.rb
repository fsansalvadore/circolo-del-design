class CreateBlogPostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_post_images do |t|
      t.string :image
      t.text :description
      t.string :width
      t.references :blog_post, foreign_key: true

      t.timestamps
    end
  end
end
