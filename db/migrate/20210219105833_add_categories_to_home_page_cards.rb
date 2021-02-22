class AddCategoriesToHomePageCards < ActiveRecord::Migration[5.2]
  def change
    add_column :home_page_cards, :content_category,       :integer
    add_column :home_page_cards, :eventy_type_category,   :integer
  end
end
