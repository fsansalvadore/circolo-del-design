class AddImageLinksToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :box_link_1_image, :string
    add_column :page_homes, :box_link_1_url, :string
    add_column :page_homes, :box_link_1_target, :string
    add_column :page_homes, :box_link_1_presence, :string
    add_column :page_homes, :box_link_2_image, :string
    add_column :page_homes, :box_link_2_url, :string
    add_column :page_homes, :box_link_2_target, :string
    add_column :page_homes, :box_link_2_presence, :string
    add_column :page_homes, :box_link_3_image, :string
    add_column :page_homes, :box_link_3_url, :string
    add_column :page_homes, :box_link_3_target, :string
    add_column :page_homes, :box_link_3_presence, :string
  end
end
