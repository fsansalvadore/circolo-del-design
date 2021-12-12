class RemoveDefaultFromHomePageCard < ActiveRecord::Migration[5.2]
  def change
    change_column_default :home_page_cards, :eventy_type_category, "Nessuna"
  end
end
