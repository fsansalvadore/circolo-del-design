class CreateMembershipsPages < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships_pages do |t|
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      t.string :meta_image
      t.string :page_label
      t.string :heading
      t.text :subheading
      t.text :content

      t.timestamps
    end
  end
end
