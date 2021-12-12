class AddDefaultToContentBlocks < ActiveRecord::Migration[5.2]
  def change
    change_column_default :content_blocks, :kind, 0
  end
end
