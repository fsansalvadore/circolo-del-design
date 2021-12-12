class CreateContentBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :content_blocks do |t|
      t.references  :contentable, polymorphic: true, null: false
      t.string      :title
      t.integer     :kind
      t.text        :rich_text
      t.string      :image
      t.string      :image_description
      t.string      :image_width
      t.integer     :video_provider
      t.string      :video_link
      t.string      :video_description
      t.string      :instagram_link
      t.string      :twitter_link
      t.integer     :audio_provider
      t.string      :soundcloud_link
      t.string      :link_url
      t.string      :link_label
      t.string      :link_target
      t.integer     :link_style
      t.boolean     :is_visible
      t.integer     :position

      t.timestamps
    end
  end
end
