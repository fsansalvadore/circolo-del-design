class AddSplashContentImgToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :splash_content_img, :string
  end
end
