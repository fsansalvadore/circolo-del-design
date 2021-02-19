class AddDefaultToHeroColorMode < ActiveRecord::Migration[5.2]
  def change
    change_column_default :page_homes, :hero_color_mode, 1
  end
end
