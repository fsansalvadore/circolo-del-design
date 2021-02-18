class CreateGlobalSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :global_settings do |t|
      t.string :site_title
      t.string :favicon
      t.string :facebook_url
      t.string :youtube_url
      t.string :instagram_url
      t.string :linkedin_url
      t.string :meta_image
      t.string :meta_description
      t.string :main_email
      t.string :main_tel
      t.string :opening_hours

      t.timestamps
    end
  end
end
