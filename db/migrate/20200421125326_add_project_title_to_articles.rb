class AddProjectTitleToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :project_title, :string
    add_column :articles, :project_studio, :string
  end
end
