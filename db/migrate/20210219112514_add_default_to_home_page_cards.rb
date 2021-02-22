class AddDefaultToHomePageCards < ActiveRecord::Migration[5.2]
  def change
    change_column_default :home_page_cards, :content_category, 0
    change_column_default :home_page_cards, :eventy_type_category, 0
  end
end
