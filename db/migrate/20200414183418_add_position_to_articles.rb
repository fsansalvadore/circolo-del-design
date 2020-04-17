class AddPositionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :position, :integer
  end
end
