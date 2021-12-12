class AddColumnTitlesToHomePage < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :column_1_title,    :string
    add_column :page_homes, :column_2_title,    :string
    add_column :page_homes, :column_3_title,    :string
  end
end
