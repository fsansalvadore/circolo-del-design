class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :subtitle
      t.string :cover
      t.string :meta_keywords
      t.string :meta_title
      t.text :meta_description
      t.string :media_type
      t.string :translation_link
      t.integer :lang, default: 1
      t.text :content
      t.text :intro
      t.datetime :publish_date
      t.boolean :published, default: false
      t.integer :priority, default: 5

      t.timestamps
    end
  end
end
