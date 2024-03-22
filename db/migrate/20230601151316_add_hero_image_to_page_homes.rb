class AddHeroImageToPageHomes < ActiveRecord::Migration[6.1]
  def change
    add_column :page_homes, :hero_image_mobile, :string
    add_column :page_homes, :hero_link, :string
    add_column :page_homes, :hero_link_target, :string
  end
end
