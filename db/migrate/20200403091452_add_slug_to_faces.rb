class AddSlugToFaces < ActiveRecord::Migration[5.2]
  def change
    add_column :faces, :slug, :string
    add_index :faces, :slug, unique: true
  end
end
