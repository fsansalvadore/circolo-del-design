class AddColumnToArticleSections < ActiveRecord::Migration[5.2]
  def change
    add_column :article_sections, :image_set, :string
  end
end
