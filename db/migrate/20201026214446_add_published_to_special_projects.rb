class AddPublishedToSpecialProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :special_projects, :published, :boolean
  end
end
