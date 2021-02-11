class AddContentImgToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :content_img, :string
  end
end
