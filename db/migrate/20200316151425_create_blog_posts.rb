class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :subtitle
      t.string :cover
      t.string :keywords
      t.text :content
      t.datetime :publish_date
      t.boolean :published, default: false
      t.integer :priority
      t.references :blog_columns, foreign_key: true

      t.timestamps
    end
  end
end
