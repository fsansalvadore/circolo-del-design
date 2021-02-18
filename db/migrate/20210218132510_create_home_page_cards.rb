class CreateHomePageCards < ActiveRecord::Migration[5.2]
  def change
    create_table :home_page_cards do |t|
      t.string    :title
      t.string    :subtitle
      t.string    :image
      t.string    :image_alt
      t.date      :start_date
      t.date      :end_date
      t.string    :link
      t.integer   :position

      t.timestamps
    end
  end
end
