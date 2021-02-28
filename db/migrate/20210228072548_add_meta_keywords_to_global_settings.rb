class AddMetaKeywordsToGlobalSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :global_settings, :meta_keywords, :string
  end
end
