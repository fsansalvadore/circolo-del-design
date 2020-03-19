class AddColumnToBlogPostSection < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_post_sections, :rich_text_small, :string
  end
end
