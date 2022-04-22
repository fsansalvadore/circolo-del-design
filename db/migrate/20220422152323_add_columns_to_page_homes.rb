class AddColumnsToPageHomes < ActiveRecord::Migration[6.1]
  def change
    add_column :page_homes, :modal_presence,  :boolean, default: false
    add_column :page_homes, :modal_image,     :string
    add_column :page_homes, :modal_link,      :string
  end
end
