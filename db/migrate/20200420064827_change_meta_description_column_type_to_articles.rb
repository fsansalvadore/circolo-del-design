class ChangeMetaDescriptionColumnTypeToArticles < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :articles, :meta_description, :string
    end

    def down
      change_column :articles, :meta_description, :text
    end
  end
end
