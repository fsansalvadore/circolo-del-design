class CreateHomePageColumnTwoLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :home_page_column_two_links do |t|
      t.string :link
      t.string :label
      t.boolean :target
      t.integer :link_style
      t.integer :position

      t.timestamps
    end
  end
end
