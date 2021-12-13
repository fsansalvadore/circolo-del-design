class AddDefaultToLinkStyle < ActiveRecord::Migration[5.2]
  def change
    change_column_default :content_blocks, :link_style, 0
  end
end
