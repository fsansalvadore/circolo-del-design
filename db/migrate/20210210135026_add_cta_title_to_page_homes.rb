class AddCtaTitleToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :cta_section_title, :string
  end
end
