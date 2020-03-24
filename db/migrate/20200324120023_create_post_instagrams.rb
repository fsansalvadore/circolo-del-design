class CreatePostInstagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :post_instagrams do |t|
      t.string :link
      t.boolean :visible
      t.references :blog_post_section, foreign_key: true

      t.timestamps
    end
  end
end
