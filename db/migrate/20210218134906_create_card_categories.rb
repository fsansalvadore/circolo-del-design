class CreateCardCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :card_categories do |t|
      t.string :title
      t.string :primary_color
      t.string :secondary_color

      t.timestamps
    end
  end
end
