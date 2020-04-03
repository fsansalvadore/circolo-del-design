class AddColumnsToFaces < ActiveRecord::Migration[5.2]
  def change
    add_column :faces, :description, :text
    add_column :faces, :link, :string
  end
end
