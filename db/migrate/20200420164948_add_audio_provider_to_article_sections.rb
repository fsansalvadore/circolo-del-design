class AddAudioProviderToArticleSections < ActiveRecord::Migration[5.2]
  def change
    add_column :article_sections, :audio_provider, :integer
  end
end
