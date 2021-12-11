class AddIsDraftInHomePageCards < ActiveRecord::Migration[5.2]
  def change
    add_column :home_page_cards, :is_draft, :boolean, default: false
  end
end
