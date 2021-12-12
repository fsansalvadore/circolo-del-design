class CreateNewsletterPages < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletter_pages do |t|
      t.string :heading
      t.text :subheading
      t.string :form_action

      t.timestamps
    end
  end
end
