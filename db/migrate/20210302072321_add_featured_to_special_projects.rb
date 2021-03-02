class AddFeaturedToSpecialProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :special_projects, :show_in_nav, :boolean
    add_column :special_projects, :featured, :boolean
    add_column :cultural_projects, :show_in_nav, :boolean
    add_column :cultural_projects, :featured, :boolean
  end
end
