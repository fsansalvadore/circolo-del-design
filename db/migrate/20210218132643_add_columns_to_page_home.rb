class AddColumnsToPageHome < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :hero_image,            :string
    add_column :page_homes, :hero_color_mode,       :integer
    add_column :page_homes, :hero_marquee_words,    :string
    add_column :page_homes, :hero_marquee_presence, :boolean
    add_column :page_homes, :social_presence,       :boolean
    add_column :page_homes, :banner_presence,       :boolean
    add_column :page_homes, :banner_img_desktop,    :string
    add_column :page_homes, :banner_img_mobile,     :string
    add_column :page_homes, :banner_link,           :string
    add_column :page_homes, :banner_target,         :boolean
  end
end
