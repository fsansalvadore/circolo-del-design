class AddRuoloToFaces < ActiveRecord::Migration[5.2]
  def change
    add_column :faces, :ruolo, :string
  end
end
