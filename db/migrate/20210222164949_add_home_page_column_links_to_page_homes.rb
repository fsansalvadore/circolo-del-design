class AddHomePageColumnLinksToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_reference :home_page_column_one_links,    :page_home, foreign_key: true
    add_reference :home_page_column_two_links,    :page_home, foreign_key: true
    add_reference :home_page_column_three_links,  :page_home, foreign_key: true
  end
end
