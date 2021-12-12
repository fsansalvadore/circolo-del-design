class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string    :title, null: false
      t.string    :abstract
      t.string    :slug
      t.integer   :lang, default: 0
      t.string    :cover
      t.integer   :priority, default: 5
      t.datetime  :published_at
      t.boolean   :is_published

      t.timestamps
    end
  end
end
