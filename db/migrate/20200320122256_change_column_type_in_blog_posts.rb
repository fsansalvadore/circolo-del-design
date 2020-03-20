class ChangeColumnTypeInBlogPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :blog_posts, :title, :text
  end
end
