class AddCarouselLinkToContentBlocks < ActiveRecord::Migration[6.1]
  def change
    add_column :content_blocks, :carousel_id, :string
  end
end
