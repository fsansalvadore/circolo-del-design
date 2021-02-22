class ChangeColumnTypeToHomePageCard < ActiveRecord::Migration[5.2]
  def change
    change_column :home_page_cards, :eventy_type_category, :string
  end
end
