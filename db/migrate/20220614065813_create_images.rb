class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references  :imageable, polymorphic: true, null: false
      t.string  :src
      t.string  :alt
      t.text    :label
      t.integer :position
      t.json    :preferences

      t.timestamps
    end
  end
end
