class AddColumnToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :paragraph_2, :text
  end
end
