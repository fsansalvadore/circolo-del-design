class CreateFaces < ActiveRecord::Migration[5.2]
  def change
    create_table :faces do |t|
      t.string :nome
      t.string :cognome
      t.string :azienda
      t.string :categoria

      t.timestamps
    end
  end
end
