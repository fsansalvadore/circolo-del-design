class AddDescriptionToCollaborators < ActiveRecord::Migration[5.2]
  def change
    add_column :collaborators, :description, :text
  end
end
