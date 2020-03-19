class AddIntroTextToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :intro, :text
  end
end
