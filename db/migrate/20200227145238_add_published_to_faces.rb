class AddPublishedToFaces < ActiveRecord::Migration[5.2]
  def change
    add_column :faces, :published, :boolean, default: true
  end
end
