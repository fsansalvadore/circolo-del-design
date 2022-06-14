class CreateCarousels < ActiveRecord::Migration[6.1]
  def change
    create_table :carousels do |t|
      t.string  :name
      t.text    :description
      t.integer :position
      t.boolean :published
      t.boolean :is_published
      t.date    :published_at

      t.timestamps
    end
  end
end
