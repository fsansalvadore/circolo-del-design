class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string  :link
      t.string  :label
      t.integer :link_style
      t.integer :position

      t.timestamps
    end
  end
end
