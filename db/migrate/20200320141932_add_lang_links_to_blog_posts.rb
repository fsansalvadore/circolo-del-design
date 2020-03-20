class AddLangLinksToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :lang_link_eng, :string
    add_column :blog_posts, :lang_link_ita, :string
  end
end
