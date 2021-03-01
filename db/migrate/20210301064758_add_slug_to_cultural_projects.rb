class AddSlugToCulturalProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :cultural_projects, :slug, :string
    add_index :cultural_projects, :slug, unique: true
  end
end
