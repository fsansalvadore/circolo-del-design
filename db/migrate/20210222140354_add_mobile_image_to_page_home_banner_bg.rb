class AddMobileImageToPageHomeBannerBg < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :splash_bg_img_mobile, :string
  end
end
