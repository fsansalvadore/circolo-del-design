class AddSubtitleToArticleThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :article_themes, :subtitle, :string
  end
end
