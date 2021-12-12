class AddHomePageReferenceToHomePageLinks < ActiveRecord::Migration[5.2]
  def change
    add_reference :home_page_links, :page_home, foreign_key: true
  end
end
