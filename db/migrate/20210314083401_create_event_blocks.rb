class CreateEventBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :event_blocks do |t|
      t.string :title
      t.boolean :visible, default: true
      t.text :rich_text
      t.string :image_url
      t.string :image_description
      t.integer :image_width
      t.integer :video_provider, default: 0
      t.string :video_link
      t.string :video_description
      t.string :instagram_link
      t.string :twitter_link
      t.string :soundcloud_link
      t.integer :position
      
      t.timestamps
    end
  end
end
