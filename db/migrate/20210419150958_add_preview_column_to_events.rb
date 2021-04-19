class AddPreviewColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :preview_link_url,      :string
    add_column :events, :preview_link_presence, :boolean
    add_column :events, :preview_link_target,   :boolean
  end
end
