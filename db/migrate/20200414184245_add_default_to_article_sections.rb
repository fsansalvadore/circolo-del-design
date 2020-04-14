class AddDefaultToArticleSections < ActiveRecord::Migration[5.2]
  def change
    change_column_default :article_sections, :visible, true
  end
end
