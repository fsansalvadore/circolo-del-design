class AddImageToFaces < ActiveRecord::Migration[5.2]
  def change
    add_column :faces, :image, :string
  end
end
