class CreateContactsPages < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts_pages do |t|
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      t.string :meta_image
      t.string :page_label
      t.string :heading
      t.text :subheading
      t.string :form_title
      t.text :form_subtitle
      t.text :address_left
      t.string :address_title
      t.string :address_subtitle
      t.string :map_image
      t.text :map_box_text
      t.string :cover_image

      t.timestamps
    end
  end
end
