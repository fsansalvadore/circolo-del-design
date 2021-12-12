class CreateAboutPages < ActiveRecord::Migration[5.2]
  def change
    create_table :about_pages do |t|
      t.string :page_label
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      t.string :meta_image
      t.string :heading
      t.text :subheading
      t.string :bg_color

      t.timestamps
    end
  end
end
