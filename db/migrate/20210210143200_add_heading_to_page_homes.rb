class AddHeadingToPageHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :page_homes, :heading, :string
    add_column :page_homes, :subheading, :text
  end
end
