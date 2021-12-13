class AddDefaultToIsVisible < ActiveRecord::Migration[5.2]
  def change
    change_column_default :content_blocks, :is_visible, true
  end
end
