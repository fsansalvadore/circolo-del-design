class CreateHomePageColumnThreeLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :home_page_column_three_links do |t|
      t.string :link
      t.string :label
      t.boolean :target
      t.integer :link_style
      t.integer :position

      t.timestamps
    end
  end
end
