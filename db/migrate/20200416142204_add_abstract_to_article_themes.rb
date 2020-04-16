class AddAbstractToArticleThemes < ActiveRecord::Migration[5.2]
  def change
    add_column :article_themes, :abstract, :text
  end
end
