class AddLinkTargetToHomePageCard < ActiveRecord::Migration[5.2]
  def change
    add_column :home_page_cards, :link_target, :boolean
  end
end
