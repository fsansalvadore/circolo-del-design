class AddColumnsToBlogPostSections < ActiveRecord::Migration[5.2]
  def change
    change_column_default :blog_post_sections, :visible, true
  end
end
