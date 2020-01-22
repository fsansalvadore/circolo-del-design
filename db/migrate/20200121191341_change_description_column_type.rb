class ChangeDescriptionColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :descrizione
    add_column :events, :descrizione, :text
  end
end
