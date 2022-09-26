class AddColumnToEventBlocks < ActiveRecord::Migration[6.1]
  def change
    add_column :event_blocks, :link_color, :string, null: true
  end
end
