class AddDefaultToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    change_column_default :blog_posts, :priority, 5
  end
end
