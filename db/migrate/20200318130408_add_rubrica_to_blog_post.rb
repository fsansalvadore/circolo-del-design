class AddRubricaToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :rubrica, :string
  end
end
