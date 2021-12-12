class AddColumnToSpecialProject < ActiveRecord::Migration[5.2]
  def change
    add_column :special_projects, :intro_media_select, :integer
  end
end
