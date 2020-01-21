class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :titolo
      t.string :sottotitolo
      t.date :data_inizio
      t.date :data_fine
      t.string :orario
      t.string :prezzo
      t.string :descrizione
      t.string :immagine
      t.string :categoria
      t.string :luogo
      t.string :durata
      t.string :posti
      t.string :target
      t.string :link
      t.boolean :published
      t.boolean :featured

      t.timestamps
    end
  end
end
