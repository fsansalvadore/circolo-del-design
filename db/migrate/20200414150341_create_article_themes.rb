class CreateArticleThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :article_themes do |t|
      t.string :nome
      t.integer :priorità
      t.integer :position
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
