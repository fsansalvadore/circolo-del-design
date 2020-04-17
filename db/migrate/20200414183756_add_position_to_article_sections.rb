class AddPositionToArticleSections < ActiveRecord::Migration[5.2]
  def change
    add_column :article_sections, :position, :integer
  end
end
