class ChangeBlogPostSectionsColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :event_blocks, :image_width, :string
  end
end
