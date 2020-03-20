class RevertColumnTypeInBlogPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :blog_posts, :title, :string
  end
end
