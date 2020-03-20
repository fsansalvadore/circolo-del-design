class ChangeColumnsInBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :title_integration, :string
    change_column :blog_posts, :subtitle, :text
  end
end
