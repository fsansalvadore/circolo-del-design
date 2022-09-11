class AddColumnsToEventBlocks < ActiveRecord::Migration[6.1]
  def change
    add_column :event_blocks, :link_style,  :integer, default: 0
    add_column :event_blocks, :link_url,    :string
    add_column :event_blocks, :link_label,  :string
    add_column :event_blocks, :link_target, :string, default: "_self"
  end
end
