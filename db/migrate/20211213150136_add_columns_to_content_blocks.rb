class AddColumnsToContentBlocks < ActiveRecord::Migration[5.2]
  def change
    add_column :content_blocks, :richtext_secondary, :text
  end
end
