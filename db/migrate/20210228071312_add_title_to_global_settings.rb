class AddTitleToGlobalSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :global_settings, :title, :string
  end
end
