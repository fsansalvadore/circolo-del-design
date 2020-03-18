class CreateBlogPostVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_post_videos do |t|
      t.string :vimeo_id
      t.text :description
      t.references :blog_post, foreign_key: true

      t.timestamps
    end
  end
end
