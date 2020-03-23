class AddMetaColumnsToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :meta_title, :string
    add_column :blog_posts, :meta_description, :string
  end
end
