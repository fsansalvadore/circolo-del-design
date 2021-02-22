class AddHomePageCardToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_reference :home_page_cards, :page_home, foreign_key: true
  end
end
