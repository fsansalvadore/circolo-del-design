class AddColumnsToWpacSections < ActiveRecord::Migration[5.2]
  def change
    add_column :wpac_sections, :preview_visibility, :boolean
    add_column :wpac_sections, :preview_img, :string
    add_column :wpac_sections, :preview_title, :string
    add_column :wpac_sections, :preview_subtitle, :text
  end
end
