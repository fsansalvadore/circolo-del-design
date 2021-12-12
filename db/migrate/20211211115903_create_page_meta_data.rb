class CreatePageMetaData < ActiveRecord::Migration[5.2]
  def change
    create_table :page_meta_data do |t|
      t.references  :metadatable, polymorphic: true, null: false
      t.string      :meta_title
      t.string      :meta_keywords
      t.text        :meta_description
      t.string      :meta_image
      t.string      :favicon

      t.timestamps
    end
  end
end
