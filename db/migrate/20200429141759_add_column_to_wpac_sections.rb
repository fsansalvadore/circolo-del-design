class AddColumnToWpacSections < ActiveRecord::Migration[5.2]
  def change
    add_column :wpac_sections, :cover_video_poster, :string
  end
end
