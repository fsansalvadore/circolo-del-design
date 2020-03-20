class AddLangToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :lang, :integer, default: 1
  end
end
