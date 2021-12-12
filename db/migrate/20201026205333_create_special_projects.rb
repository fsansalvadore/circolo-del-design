class CreateSpecialProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :special_projects do |t|
      t.string  :title
      t.boolean :intro_media_type
      t.string  :intro_image
      t.string  :intro_video
      t.string  :intro_video_provider
      t.text    :content
      t.string  :link_cta
      t.string  :link_url
      t.date    :year
      t.string  :cover
      t.string  :meta_keywords
      t.string  :meta_title
      t.string  :meta_description
      t.string  :slug

      t.timestamps
    end
  end
end
