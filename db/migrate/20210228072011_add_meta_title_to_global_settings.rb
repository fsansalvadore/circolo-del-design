class AddMetaTitleToGlobalSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :global_settings, :meta_title, :string
  end
end
