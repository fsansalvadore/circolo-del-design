class CreateCulturalProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :cultural_projects do |t|
      t.string :title
      t.integer :intro_media_type
      t.string :intro_image
      t.string :intro_video
      t.string :intro_video_provider
      t.text :content
      t.string :link_cta
      t.string :link_url
      t.date :start_date
      t.string :end_date
      t.string :cover
      t.string :meta_title
      t.string :meta_keywords
      t.string :meta_description
      t.integer :intro_media_select
      t.boolean :published

      t.timestamps
    end
  end
end
