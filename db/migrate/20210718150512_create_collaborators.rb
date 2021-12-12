class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.string :nome
      t.string :cognome
      t.string :image
      t.integer :position
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
