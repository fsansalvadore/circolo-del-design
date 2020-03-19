class AddColumnToBlogPostSections < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_post_sections, :section_title, :string
  end
end
